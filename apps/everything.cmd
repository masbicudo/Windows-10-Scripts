call require places.cmd
call require apps\choco.cmd

choco install -y everything
call rm-desktop-link everything
call set-where where_everything "everything.exe"
shortcut-create "%where_shortcuts%\fnd.lnk" "%where_everything%"
shortcut-create "%where_shortcuts%\fnda.lnk" "%where_everything%" -ra
