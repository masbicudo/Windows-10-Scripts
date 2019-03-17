// https://social.technet.microsoft.com/Forums/scriptcenter/en-US/c6ba6f4b-0628-4b10-a12a-89ff7e387851/script-to-query-addremove-programs-list?forum=ITCG
// http://www.ordon.it/simple-vbs-script-for-uninstalling-software/

var strComputer = "."
var keypath = "HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\"

var cfg_named_prams = {
    "filter": 1
}
var named = {}
var params = []
var cur_name = null
var to_read = 0
for (var a = 0; a < WScript.Arguments.Count(); a++) {
    var arg = WScript.Arguments.Item(a)

    if (to_read) {
        named[cur_name].push(arg)
        to_read--
    }
    else if (/^--/.test(arg)) {
        cur_name = arg.substring(2)
        if (cfg_named_prams.hasOwnProperty(cur_name)) {
            to_read = cfg_named_prams[cur_name]
            if (!named[cur_name]) named[cur_name] = []
        }
    }
    else {
        params.push(arg)
    }

    if (to_read == 0) cur_name = null
}

var Reg = ImportReg()
var reg = new Reg(strComputer)
var key = reg.key(keypath)
var keys = key.keys()
var items = []
for (var i = 0; i < keys.length; i++) {
    var value = keys[i].stringValue("DisplayName").read()
    var regex = { test: function(){return true} }
    if (named.filter) {
        var strrgx = []
        for (var j = 0; j < named.filter.length; j++) {
            strrgx.push("(?:" + named.filter[j] + ")")
        }
        var regex = new RegExp(strrgx.join("|"), "ig")
    }
    if (value && regex.test(value)) items.push(value)
}

WScript.Echo(items.join("\n"))
if (items.length == 0) WScript.Quit(1)
WScript.Quit(0)

function ImportReg() {
    var HKEY_CLASSES_ROOT = 0x80000000
    var HKEY_CURRENT_USER = 0x80000001
    var HKEY_LOCAL_MACHINE = 0x80000002
    var HKEY_USERS = 0x80000003
    var HKEY_PERFORMANCE_DATA = 0x80000004
    var HKEY_CURRENT_CONFIG = 0x80000005

    var REG_SZ = 1
    var REG_EXPAND_SZ = 2
    var REG_BINARY = 3
    var REG_DWORD = 4
    var REG_MULTI_SZ = 7
    var REG_QWORD = 11

    var mmap = [null,"GetStringValue","GetStringValue","GetBinaryValue","GetDWORDValue",null,null,"GetMultiStringValue",null,null,null,"GetQWORDValue"]
    var pmap = [null,"sValue","sValue","uValue","uValue",null,null,"sValue",null,null,null,"uValue"]
    var gmap = [null,fsingle,fsingle,fsingle,fsingle,null,null,farray,null,null,null,farray]

    var roots = {
        "HKLM": HKEY_LOCAL_MACHINE,
        "HKCU": HKEY_CURRENT_USER
    }

    var getValParams = ["hDefKey", "sSubKeyName", "sValueName"]
    var enumParams = ["hDefKey", "sSubKeyName"]

    return Reg

    function makeMofMethod(obj, methodName, params) {
        var m = obj.Methods_.Item(methodName)
        return function() {
            var objParamsIn = m.InParameters.SpawnInstance_()
            for (var i = 0; i < params.length; i++)
                objParamsIn[params[i]] = arguments[i]
            var objParamsOut = obj.ExecMethod_(m.Name, objParamsIn)
            return objParamsOut
        }
    }

    function Reg(computerName) {
        var objService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\\\"+computerName+"\\root\\default")
        var objReg = objService.Get("StdRegProv")
        
        var mEnumKey = makeMofMethod(objReg, "EnumKey", enumParams);
        var mEnumValues = makeMofMethod(objReg, "EnumValues", enumParams);

        var ctx = {
            "objReg": objReg,
            "mEnumKey": mEnumKey,
            "mEnumValues": mEnumValues
        }

        this.key = function(path) {
            var root = path.substring(0, path.indexOf("\\"))
            var rootNum = roots[root]
            var keypath = path.substring(path.indexOf("\\")+1)
            return new RegKey(ctx, rootNum, keypath)
        }
    }

    function RegKey(ctx, rootNum, keypath) {
        var pathitems = keypath.split("\\")
        this.name = pathitems[pathitems.length - 2]

        this.keys = function() {
            var res = ctx.mEnumKey(rootNum, keypath)
            if (res.ReturnValue !== 0) return null
            if (res.sNames == null) return null
            var items = res.sNames.toArray()
            for (var i = 0; i < items.length; i++)
                items[i] = new RegKey(ctx, rootNum, keypath+items[i]+"\\")
            return items
        }

        this.key = function(name) {
            return new RegKey(ctx, rootNum, keypath+name+"\\")
        }

        this.values = function() {
            var res = ctx.mEnumValues(rootNum, keypath)
            if (res.ReturnValue !== 0) return null
            if (res.sNames == null) return null
            var items = res.sNames.toArray()
            var types = res.Types.toArray()
            for (var i = 0; i < items.length; i++)
                items[i] = new RegVal(ctx, rootNum, keypath, items[i], types[i])
            return items
        }

        this.stringValue = function(name) {
            return new RegVal(ctx, rootNum, keypath, name, REG_SZ)
        }

        this.int32Value = function(name) {
            return new RegVal(ctx, rootNum, keypath, name, REG_DWORD)
        }

        this.int64Value = function(name) {
            return new RegVal(ctx, rootNum, keypath, name, REG_QWORD)
        }

        this.binaryValue = function(name) {
            return new RegVal(ctx, rootNum, keypath, name, REG_BINARY)
        }

        this.multiStringValue = function(name) {
            return new RegVal(ctx, rootNum, keypath, name, REG_MULTI_SZ)
        }
    }

    function fsingle(outparam, mGet, rootNum, keypath, name) {
        var out = mGet(rootNum, keypath, name);
        if (out.ReturnValue !== 0) return null;
        return out[outparam]
    }

    function farray(outparam, mGet, rootNum, keypath, name) {
        var out = mGet(rootNum, keypath, name);
        if (out.ReturnValue !== 0 || out[outparam] == null) return null;
        return out[outparam].toArray()
    }

    function RegVal(ctx, rootNum, keypath, name, type) {
        var outparam = pmap[type]
        var getter = gmap[type]

        var mGet = makeMofMethod(ctx.objReg, mmap[type], getValParams)

        this.name = name

        this.read = function() {
            var value = getter(outparam, mGet, rootNum, keypath, name)
            return value
        }
    }
}