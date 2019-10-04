@cc_on /* >nul 2>&1
:: ref: https://stackoverflow.com/questions/10711839/using-a-custom-tee-command-for-bat-file/10719322#10719322
:: Batch Script
@echo off
cscript //E:JScript //nologo "%~f0" %*
exit /b
*/
// JavaScript
var ws = WScript, args = ws.Arguments, _in = ws.StdIn, out = ws.StdOut
var fso = new ActiveXObject("Scripting.FileSystemObject")
var mode = args.Count() >= 2 ? 8 : 2
var fs = fso.OpenTextFile(args(0),mode,true)
var line = ""
while(!_in.AtEndOfStream) {
  line = _in.ReadLine()
  out.WriteLine(line)
  fs.WriteLine(line)
}
