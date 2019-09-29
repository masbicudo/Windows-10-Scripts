call require apps\choco.cmd
call require places.cmd
choco install -y speccy

call rm-desktop-link speccy
call set-where where_speccy "speccy.exe"
shortcut-create "%where_shortcuts%\spc.lnk" "%where_speccy%"
