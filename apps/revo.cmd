call require apps\choco.cmd
call require places.cmd
choco install -y revo-uninstaller

call rm-desktop-link revo
call set-where where_revo "RevoUnin.exe"
shortcut-create "%where_shortcuts%\revo.lnk" "%where_revo%"
