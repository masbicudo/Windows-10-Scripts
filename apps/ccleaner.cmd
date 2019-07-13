call require apps\choco.cmd
choco upgrade -y ccleaner
call set-where where_ccleaner ccleaner.exe
shortcut-create "%where_shortcuts%\cc.lnk" "%where_ccleaner%"
call rm-desktop-link ccleaner
