var htmlfile = WSH.CreateObject('htmlfile')
htmlfile.write('<meta http-equiv="x-ua-compatible" content="IE=9" />')
var JSON = htmlfile.parentWindow.JSON
htmlfile.close()
// Production steps of ECMA-262, Edition 5, 15.4.4.19
// Reference: http://es5.github.io/#x15.4.4.19
function array_fn(create, process) {
  return function(callback/*, thisArg*/) {
    'use strict'
    var T, refR, k
    if (this == null) throw new TypeError('this is null or not defined')
    var O = Object(this)
    var len = O.length >>> 0
    if (arguments.length == 0) callback = function(x) { return x }
    if (typeof callback !== 'function') throw new TypeError(callback + ' is not a function')
    if (arguments.length > 1) T = arguments[1]
    refR = [create(len)]
    k = 0
    while (k < len) {
      var kValue, fValue
      if (k in O) {
        kValue = O[k]
        fValue = callback.call(T, kValue, k, O)
        if (!process(fValue, refR, k)) return refR[0]
      }
      k++
    }
    return refR[0]
  }
}
every = array_fn(
  function(){return true},
  function(fValue, refR, k){refR[0] = fValue;return fValue})
map = array_fn(
  Array,
  function(fValue, refR, k){refR[0][k] = fValue;return true})

var arg_spec = {
    "f": "file", "file": 1,
    "r": "replace", "replace": 1,
    "s": "select", "select": 1,
    "t": "test", "test": 0,
    "d": "debug", "debug": 0,
    "i": "case-insensitive", "case-insensitive": 0,
    "c": "command", "command": -1
}
var args = []
var cnt = 0
var name = null
var pnum = 0
for (var k = 0; k < WScript.Arguments.length; k++) {
    var value = WScript.Arguments.Item(k)
    if (cnt) {
        if (!(name in args)) args[name] = value
        else if (!(args[name] instanceof Array)) args[name] = [args[name], value]
        else args[name].push(value)
        cnt--
    }
    else if (/^--/.test(value)) {
        name = value.substr(2)
        cnt = arg_spec[name]
        if (cnt == 0) args[name] = true
    }
    else if (/^-/.test(value)) {
        name = arg_spec[value.substr(1)]
        cnt = arg_spec[name]
        if (cnt == 0) args[name] = true
    }
    else {
        args[pnum++] = value
    }
}

if (!!args.file + !!args.command > 1)
    throw new Error("Can only specify one of these options: 'file' or 'command'")

if (args.debug) {
    var json = JSON.stringify(args)
    WScript.Echo(json)
    WScript.Quit()
}

var s = WScript.StdIn

if (args.command) {
    var list = typeof args.command == "string" ? [args.command] : args.command
    var cmd = ""
    for (var i = 0; i < list.length; i++) {
        var li = list[i]
        if (cmd != "") cmd += " "
        li = li.replace(/\|\(\)\^/g, "^$1")
        cmd += /\s,/g.test(li) ? '"'+li+'"' : li
    }
    var sh = new ActiveXObject("WScript.Shell")
    var proc = sh.exec(cmd)
    // var WshRunning = 0, WshFinished = 1, WshFailed = 2
    // while (proc.Status == WshRunning) {}
    // if (proc.Status == WshFinished) s = proc.StdOut
    // if (proc.Status == WshFailed) s = proc.StdErr
    s = proc.StdOut
}

if (args.file) {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    s = fso.OpenTextFile(args.file, 1, true);
}

var rs = map.call(args, function(x) {return new RegExp(x, "g" + (args["case-insensitive"] ? "i" : ""))})
while (!s.AtEndOfStream) {
    var line = s.ReadLine()
    if (args.test) {
        if (every.call(rs, function(r){return r.test(line)})) WScript.Echo(line)
    }
    else if (args.replace) {
        for (var k = 0; k < rs.length; k++)
            line = line.replace(rs[k], args.replace)
        WScript.Echo(line)
    }
    else {
        var execs = map.call(rs, function(r){return r.exec(line)})
        if (every.call(execs)) {
            var pos = args.select || 0
            for (var k = 0; k < execs.length; k++)
                if (pos < execs[k].length)
                    WScript.Echo(execs[k][pos])
        }
    }
}
s.Close()
