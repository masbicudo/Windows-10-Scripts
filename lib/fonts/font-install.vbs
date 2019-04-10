Set fso = CreateObject("Scripting.FileSystemObject")
Set wshShell = CreateObject("WScript.Shell")

Const FONTS = &H14& 

fontsFolder = wshShell.SpecialFolders("Fonts")
Set objFile = fso.getFile(WScript.Arguments(0))

If not fso.FileExists(fontsFolder & "\" & objFile.Name) Then

    Set objShell = CreateObject("Shell.Application")
    Set objNamespace = objShell.Namespace(FONTS)
    objNamespace.CopyHere WScript.Arguments(0)

End If
