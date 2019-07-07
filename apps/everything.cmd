call require places.cmd
call require apps\choco.cmd

choco upgrade -y everything
call rm-desktop-link everything
call set-where where_everything "everything.exe"
shortcut-create "%where_shortcuts%\fnd.lnk" "%where_everything%"
shortcut-create "%where_shortcuts%\fnda.lnk" "%where_everything%" -ra
shortcut-create "%where_shortcuts%\fndn.lnk" "%where_everything%" -a -newwindow
shortcut-create "%where_shortcuts%\fndan.lnk" "%where_everything%" -ra -a -newwindow
shortcut-create "%where_shortcuts%\fndna.lnk" "%where_everything%" -ra -a -newwindow
