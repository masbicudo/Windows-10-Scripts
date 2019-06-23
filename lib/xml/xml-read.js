// usage:
// xml-read "file.xml" ""

/// <reference path="./msxml2.domdocument.d.ts" />

var par = []
for (var i = 0; i < WScript.Arguments.length; i++) {
    var a = WScript.Arguments.Item(i)
    if (a == "--mode" || a == "-m") {
        par.mode = WScript.Arguments.Item(++i).toLowerCase()
    }
    else if (a == "--var" || a == "-v") {
        par["var"] = WScript.Arguments.Item(++i)
    }
    else
        par.push(a)
}
var filename = par[0]
var xpath = par[1]

var fmt_decl = "nodes={0}", fmt_var = "{0}"
var _var = par["var"] || "xml_nodes"
if (par.mode == "cmd") {
    fmt_decl = '@ECHO OFF\nSET '+_var+'.length={0}'
    fmt_var = 'SET '+_var+'[{0}]={1}'
}
else if (par.mode == "bash") {
    fmt_decl = 'declare -a '+_var
    fmt_var = _var+'[{0}]={1}'
}

var dom = new ActiveXObject("Msxml2.DOMDocument.6.0")

if (!dom.load(filename))
    throw new Error("file not found")

function format(fmt, arr) {
    return fmt.replace(/\{(\d+)\}/g, function(m) { return arr[parseInt(m.slice(1,-1))] })
}

var xmldoc = dom.documentElement
var nodes = xmldoc.selectNodes(xpath)
WScript.Echo(format(fmt_decl, [nodes.length]))

for (var i = 0; i < nodes.length; i++)
    WScript.Echo(format(fmt_var, [i, nodes.item(i).text]))
