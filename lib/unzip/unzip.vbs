' source: https://github.com/masbicudo/Windows-Scripts/tree/master/modules/unzip-v1.0.0

Function Unzip(sourceFile, destFolder)

    ' This Sub extracts FILE specified in sourceFile to the path specified in destFolder.
    '
    ' Improved by Miguel Angelo Santos Bicudo
    ' http://www.masbicudo.com
    '
    ' Based on script written By Justin Godden 2010
    ' http://stackoverflow.com/a/7947219/195417
    
    ' Constants
    Const ForReading = 1, ForWriting = 2, ForAppending = 8

    ' Create a File System Object
    Set objFSO = CreateObject("Scripting.FileSystemObject")

    ' Get the absolute path of the source file
    sourceFile = objFSO.GetAbsolutePathName(sourceFile)
    
    ' Check if the specified target file or folder exists,
    ' and build the fully qualified path of the target file
    Set oShell = CreateObject("WScript.Shell")
    If destFolder = "" Then
        destFolder = objFSO.GetParentFolderName(sourceFile)
    End If
    
    ' Get the absolute path of the output directory
    destFolder = objFSO.GetAbsolutePathName(destFolder)
    If Right(destFolder, 1) <> "\" Then destFolder = destFolder & "\"


    If Not objFSO.FileExists(sourceFile) Then
        Err.Raise -10837, "unzip.vbs", "File to unzip not found."
    Else
        Set shellApp = CreateObject("Shell.Application")
        Set objSource = shellApp.NameSpace(sourceFile).Items()
        Set objTarget = shellApp.NameSpace(destFolder)
        
        ' reference: https://docs.microsoft.com/en-us/previous-versions/tn-archive/ee176633(v=technet.10)
        '
        ' &H0&    Displays a progress dialog box that shows the name of each file being copied.
        ' &H4&    Copies files without displaying a dialog box.
        ' &H8&    Automatically creates a new folder name if a folder with that same name already exists.
        ' &H10&   Automatically responds "Yes to All" to any dialog box that appears.
        '           For example, if you attempt to copy over existing files, a dialog box appears,
        '           asking whether you are sure you want to copy over each file.
        '           Selecting this option is identical to clicking Yes to All within that dialog box.
        ' &H40&   Preserves undo information. After the script has completed,
        '           you can open Windows Explorer and select Undo from the Edit menu to undo the copy procedure.
        ' &H100&  Displays a simple progress dialog box that does not show the name of each file being copied. 
        '           Instead, it merely indicates that the copying procedure is in progress.
        intOptions = &H14&
        
        objTarget.CopyHere objSource, intOptions

    End If

End Function

src = ""
dest = ""

Set NamedArgs = WScript.Arguments.Named
If NamedArgs.Exists("src") Then
    src = NamedArgs.Item("src")
ElseIf WScript.Arguments.Length > 0 Then
    src = WScript.Arguments(0)
End If

If NamedArgs.Exists("dest") Then
    dest = NamedArgs.Item("dest")
ElseIf WScript.Arguments.Length > 1 Then
    dest = WScript.Arguments(1)
End If

Set fso = CreateObject("Scripting.FileSystemObject")
Sub CreateFolder(strPath)
    tmpArr = Split(strPath, "\")
    tmpPath = tmpArr(0)
    If Len(tmpPath) > 0 Then
        On Error Resume Next
        For i = 1 To UBound(tmpArr)
            fso.CreateFolder tmpPath
            tmpPath = tmpPath & "\" & tmpArr(i)
        Next
        fso.CreateFolder tmpPath
        On Error Goto 0
    End If
End Sub

If src <> "" Then
    Set oFSO = CreateObject("Scripting.FileSystemObject")
    CreateFolder dest
    Unzip src, dest
Else
    WScript.Echo "You must indicate a source Zip file."
End If
