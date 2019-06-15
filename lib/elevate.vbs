Set WshShell = CreateObject("WScript.Shell")
strCurDir = WshShell.CurrentDirectory
Set UAC = CreateObject("Shell.Application")
args = "/c "
For Each strArg in WScript.Arguments
  If Len(args) > 0 Then
    args = args & " "
  End If
  If InStr(strArg, " ") > 0 Then
    args = args & """" & strArg & """"
  Else
    args = args & strArg
  End If
Next
UAC.ShellExecute "C:\Windows\System32\cmd.exe", args, "", "runas", 1
