if not "%1"=="" goto :%1

:enable-searchui
meta option enable "SearchUI"
    :: ref: https://www.techsupportalert.com/content/how-disable-searchuiexe-windows-10.htm#comment-135213
    pushd %windir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy
    takeown /f SearchUI.exe
    icacls SearchUI.exe /grant *S-1-5-32-544:F
    taskkill /f /im SearchUI.exe
    rename SearchUI.exe SearchUI.exe.001
    popd
goto :EOF
:disable-searchui
meta option disable "SearchUI"
    pushd %windir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy
    takeown /f SearchUI.exe.001
    icacls SearchUI.exe.001 /grant *S-1-5-32-544:F
    rename SearchUI.exe.001 SearchUI.exe
    popd
goto :EOF
