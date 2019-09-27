' Arguments
' Link File Path
' Target Path
' -h --help           print help
' -i --icon           icon_path
' -i --icon           icon_number
' -d --desc           description
' -hk --hot-key       hot key sequence
' -ws --window-style  window style
' -wd --work-dir      working directory
' -ra --run-as-admin  run as administrator flag
' -a --args           arguments to pass to the target (must be last param)

Set args = Wscript.Arguments
Set fso = CreateObject("Scripting.FileSystemObject")
Set objShell = WScript.CreateObject("WScript.Shell")

Set lnk = Nothing
linkpath = ""
target = ""
Function GetOrCreateLink
  If lnk Is Nothing Then
    linkpath = args.Item(0)
    If args.Length > 1 Then: target = args.Item(1)
    If fso.FileExists(linkpath) Then
      fso.DeleteFile(linkpath)
    End If
    Set lnk = objShell.CreateShortcut(linkpath)
    lnk.TargetPath = target
    lnk.WorkingDirectory = fso.GetParentFolderName(target)
  End If
  Set GetOrCreateLink = lnk
End Function

prev_arg = ""
runas_admin = False
For Each arg In args
  If StrComp(arg, "-h") = 0 Or StrComp(arg, "--help") = 0 Then
      WScript.Echo _
        "create-shortcut.vbs [options] | Link-File-Path Target-Path [shortcut options]" & vbCrLf & _
        "Link-File-Path                     path of the .lnk file to create" & vbCrLf & _
        "Target-Path                        link target path" & vbCrLf & _
        "shortcut options:" & vbCrLf & _
        "  ( -i | --icon ) path:            sets an icon by using a path to an icon file" & vbCrLf & _
        "  ( -i | --icon ) number:          sets an icon by using a resource index into the source file" & vbCrLf & _
        "  ( -d | --desc ) str:             description of the shortcut file, displayed as a tool-tip" & vbCrLf & _
        "  ( -hk | --hotkey ) keys:         hot key sequence (e.g. ""ALT+CTRL+X"")" & vbCrLf & _
        "                                   [ALT+][CTRL+][SHIFT+][EXT+](A-Z|0-9|Back|Tab|Clear|Return|Escape|Space|Prior)" & vbCrLf & _
        "  ( -ws | --window-style ) value:  window style" & vbCrLf & _
        "                                   (Normal|1)|(Maximized|3)|(Minimized|7)" & vbCrLf & _
        "  ( -wd | --work-dir ) path:       working directory" & vbCrLf & _
        "  ( -ra | --run-as-admin ):        run as administrator flag" & vbCrLf & _
        "  ( -a | --args ) ...:             arguments to pass to the target (must be last param)" & vbCrLf & _
        "options:" & vbCrLf & _
        "  ( -h | --help ):                 shows this help page"
      Wscript.Quit
  ElseIf StrComp(prev_arg, "-a") = 0 Or StrComp(prev_arg, "--args") = 0 Then
    If Len(GetOrCreateLink.Arguments) > 0 Then
      GetOrCreateLink.Arguments = GetOrCreateLink.Arguments & " "
    End If
    If StrComp(arg, "") = 0 Then
      GetOrCreateLink.Arguments = GetOrCreateLink.Arguments & """"""
    ElseIf InStr(arg, " ") > 0 Then
      GetOrCreateLink.Arguments = GetOrCreateLink.Arguments & """" & arg & """"
    Else
      GetOrCreateLink.Arguments = GetOrCreateLink.Arguments & arg
    End If
  Else
    If StrComp(arg, "-ra") = 0 Or StrComp(arg, "--run-as-admin") = 0 Then
	    runas_admin = True
    ElseIf StrComp(prev_arg, "-d") = 0 Or StrComp(prev_arg, "--desc") = 0 Then
      GetOrCreateLink.Description = arg
    ElseIf StrComp(prev_arg, "-i") = 0 Or StrComp(prev_arg, "--icon") = 0 Then
      If IsNumeric(arg) Then
        GetOrCreateLink.IconLocation = target & "," & arg
      Else
        GetOrCreateLink.IconLocation = arg
      End If
    ElseIf StrComp(prev_arg, "-hk") = 0 Or StrComp(prev_arg, "--hot-key") = 0 Then
      GetOrCreateLink.HotKey = arg
    ElseIf StrComp(prev_arg, "-ws") = 0 Or StrComp(prev_arg, "--window-style") = 0 Then
      n_windowstyle = 1
      On Error Resume Next
      n_windowstyle = CInt(arg)
      On Error GoTo 0
      If StrComp(arg, "Normal", VBTextCompare) = 0 Or StrComp(arg, "Normal window", VBTextCompare) = 0 Then n_windowstyle = 1
      If StrComp(arg, "Maximized", VBTextCompare) = 0 Or StrComp(arg, "Maximized window", VBTextCompare) = 0 Then n_windowstyle = 3
      If StrComp(arg, "Minimized", VBTextCompare) = 0 Or StrComp(arg, "Minimized window", VBTextCompare) = 0 Then n_windowstyle = 7
      GetOrCreateLink.WindowStyle = n_windowstyle
    ElseIf StrComp(prev_arg, "-wd") = 0 Or StrComp(prev_arg, "--work-dir") = 0 Then
      GetOrCreateLink.WorkingDirectory = arg
    End If
    prev_arg = arg
  End If
Next
GetOrCreateLink.Save

If runas_admin Then
  data = ReadAllBytes(linkpath)
  data(21) = data(21) Or 32
  WriteAllBytes linkpath, data
End If

'Clean up
Set lnk = Nothing
Set fso = Nothing
Set objShell = Nothing

Function ReadAllBytes(path)
  Dim ts, f, a(), i, fso
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.GetFile(path)
  Redim a(f.Size - 1)
  Set ts = fso.OpenTextFile(path, 1)
  i = 0
  While Not ts.AtEndOfStream
    a(i) = Asc(mid(ts.Read(1), 1, 1))
	i = i + 1
  Wend
  ts.Close
  ReadAllBytes = a
End Function

Function WriteAllBytes(path, data)
  Dim ts, fso
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set ts = fso.CreateTextFile(path, true, false)
  For i = 0 To UBound(data)
    ts.Write(Chr(data(i)))
  Next
  ts.Close
End Function
