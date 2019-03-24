' Arguments
' Link File Path
' Target Path
' -h print help
' -i icon_path
' -i icon_number
' -d description
' -hk hot key sequence
' -ws window style
' -wd working directory
' -ra run as administrator flag
' -a arguments to pass to the target (must be last param)

Set args = Wscript.Arguments
linkpath = args.Item(0)
target = ""
If args.Length > 1 Then: target = args.Item(1)

Set fso = CreateObject("Scripting.FileSystemObject")

Set objShell = WScript.CreateObject("WScript.Shell")

If fso.FileExists(linkpath) Then
  fso.DeleteFile(linkpath)
End If

Set lnk = Nothing
Function GetOrCreateLink
  If lnk Is Nothing Then
    Set lnk = objShell.CreateShortcut(linkpath)
  End If
  Set GetOrCreateLink = lnk
End Function

GetOrCreateLink.TargetPath = target
GetOrCreateLink.WorkingDirectory = fso.GetParentFolderName(target)

prev_arg = ""
runas_admin = False
For Each arg In args
  If StrComp(arg, "-h") = 0 Then
      WScript.Echo _
        "create-shortcut.vbs -h | ""Link File Path"" ""Target Path"" [options]" & vbCrLf & _
        "-h shows this help page" & vbCrLf & _
        """Link File Path"" path of the .lnk file to create" & vbCrLf & _
        """Target Path"" link target" & vbCrLf & _
        "options:" & vbCrLf & _
        "  -i icon_path" & vbCrLf & _
        "  -i icon_number" & vbCrLf & _
        "  -d description" & vbCrLf & _
        "  -hk hot key sequence" & vbCrLf & _
        "  -ws window style" & vbCrLf & _
        "  -wd working directory" & vbCrLf & _
        "  -ra run as administrator flag" & vbCrLf & _
        "  -a arguments to pass to the target (must be last param)"
      Wscript.Quit
  ElseIf StrComp(prev_arg, "-a") = 0 Then
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
    If StrComp(arg, "-ra") = 0 Then
	  runas_admin = True
    ElseIf StrComp(prev_arg, "-d") = 0 Then
      GetOrCreateLink.Description = arg
    ElseIf StrComp(prev_arg, "-i") = 0 Then
      If IsNumeric(arg) Then
        GetOrCreateLink.IconLocation = target & "," & arg
      Else
        GetOrCreateLink.IconLocation = arg
      End If
    ElseIf StrComp(prev_arg, "-hk") = 0 Then
      GetOrCreateLink.HotKey = arg
    ElseIf StrComp(prev_arg, "-ws") = 0 Then
      GetOrCreateLink.WindowStyle = arg
    ElseIf StrComp(prev_arg, "-wd") = 0 Then
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
  Dim ts, f, a(), i
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
  Dim ts
  Set ts = fso.CreateTextFile(path, true, false)
  For i = 0 To UBound(data)
    ts.Write(Chr(data(i)))
  Next
  ts.Close
End Function
