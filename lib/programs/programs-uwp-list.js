// usage:
// Example:
//  programs-uwp-list.js --pkg "Edge" --id "Edge"

/// <reference path="./msxml2.domdocument.d.ts" />

// https://stackoverflow.com/questions/38359492/how-can-i-create-a-desktop-shortcut-for-a-windows-10-universal-app-using-powersh

if (!String.prototype.trim) {
    String.prototype.trim = function () {
        return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
    };
}

var cfg_named_prams = {
    "pkg": 1,
    "id": 1
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

var pkgrgx = new RegExp(named.pkg, "gi")
var idrgx = new RegExp(named.id, "gi")

var dom = new ActiveXObject("Msxml2.DOMDocument.6.0")
dom.setProperty("SelectionNamespaces", "xmlns:d='http://schemas.microsoft.com/appx/manifest/foundation/windows10'")

// importing JSON class
var htmlfile = WSH.CreateObject('htmlfile');
htmlfile.write('<meta http-equiv="x-ua-compatible" content="IE=9" />');
var JSON = htmlfile.parentWindow.JSON;
htmlfile.close();

var uwp_items = []
var json = get_appxpackage()
for (var p = 0; p < json.length; p++) {
    var pkg = json[p]
    if (pkgrgx.test(pkg.Name)) {
        var path = pkg.InstallLocation
        var manifestpath = path + "\\AppxManifest.xml"

        if (!dom.load(manifestpath))
            throw new Error("file not found")

        var xmldoc = dom.documentElement
        var nodes = xmldoc.selectNodes("//d:Application")

        for (var j = 0; j < nodes.length; j++) {
            var appnode = nodes.item(j)
            var id = appnode.getAttribute("Id")
            if (idrgx.test(id)) {
                uwp_items.push(pkg.PackageFamilyName+"!"+id)
            }
        }
    }
}

WScript.Echo(uwp_items.join("\n"));

function get_appxpackage() {
    var strpkgs = posh("get-appxpackage")
    var pkgs = []
    if (strpkgs) {
        var lines = strpkgs.split(/\n/g)
        lines.push("")
        var pkg = {}
        for (var l = 0; l < lines.length; l++) {
            var line = lines[l].trim()
            if (line == "") {
                if (pkg.Name)
                    pkgs.push(pkg)
                pkg = {}
            }
            else {
                var locdiv = line.indexOf(":")
                var k = line.substring(0, locdiv).trim()
                var v = line.substring(locdiv + 1).trim()
                pkg[k] = v
            }
        }
    }
    return pkgs
}

function posh(pscommand) {
    var sh = new ActiveXObject("WScript.Shell")
    var cmd = sh.ExpandEnvironmentStrings("%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe") + " -noprofile -command " + pscommand
    WScript.Echo(cmd)
    var exec = sh.Exec(cmd)
    exec.StdIn.Close()
    var str = exec.StdOut.ReadAll()
    return str
}