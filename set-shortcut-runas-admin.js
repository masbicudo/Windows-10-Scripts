(function(globalScope) {
    'use strict';
	if(WScript.arguments.length == 0)
		return;
	
    var fso = new ActiveXObject("Scripting.FileSystemObject"),
        path = WScript.arguments(0),
        newPath = WScript.arguments.length > 1 && WScript.arguments(1) || path;

    function readAllBytes(path) {
        var ts = fso.OpenTextFile(path, 1), a = [];
        while (!ts.AtEndOfStream)
            a.push(ts.Read(1).charCodeAt(0));
        ts.Close();
        return a;
    }

    function writeBytes(path, data) {
        var ts = fso.CreateTextFile(path, true),
            i=0, L = data.length;
        for (; i<L; i++) {
            ts.Write(String.fromCharCode(data[i]));
        }
        ts.Close();
    }

    function makeLnkRunAs(path, newPath) {
        var a = readAllBytes(path);
        a[0x15] |= 0x20; // flip the bit.
        writeBytes(newPath, a);
    }

    makeLnkRunAs(path, newPath);

}(this));