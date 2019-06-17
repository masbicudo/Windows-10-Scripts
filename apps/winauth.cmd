call require apps\7zip.cmd
call require apps\choco.cmd
call require places.cmd

call set-where "where_winauth_dl" "WinAuth-3.6.2.zip" --clear

if not defined where_winauth_dl (
    curl -L -o "%where_downloads%\WinAuth-3.6.2.zip" https://github.com/winauth/winauth/releases/download/3.6.2/WinAuth-3.6.2.zip
    set "where_winauth_dl=%where_downloads%\WinAuth-3.6.2.zip"
)
mkdir %SystemDrive%\Portable\winauth\
7z x "%where_winauth_dl%" -o"%SystemDrive%\Portable\winauth\" -y

set where_winauth="%SystemDrive%\Portable\winauth\WinAuth.exe"
shortcut-create "%where_shortcuts%\winauth.lnk" "%where_winauth%"
shortcut-create "%where_shortcuts%\auth.lnk" "%where_winauth%"
shortcut-create "%where_shortcuts%\otp.lnk" "%where_winauth%"
shortcut-create "%where_shortcuts%\wauth.lnk" "%where_winauth%"
