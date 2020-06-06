call require apps\choco.cmd
choco install -y fiddler
call rm-desktop-link fiddler
call set-where where_fiddler "fiddler.exe"
shortcut-create "%where_shortcuts%\fiddler.lnk" "%where_fiddler%"
