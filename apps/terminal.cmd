call require apps\choco.cmd

choco upgrade -y microsoft-windows-terminal

call set-where where_terminal wt.exe
call shortcut-create "%where_shortcuts%\terminal.lnk" "%where_terminal%" -wd ""
call shortcut-create "%where_shortcuts%\terminala.lnk" "%where_terminal%" -wd "" -ra
call shortcut-create "%where_shortcuts%\winterm.lnk" "%where_terminal%" -wd ""
call shortcut-create "%where_shortcuts%\winterma.lnk" "%where_terminal%" -wd "" -ra
call shortcut-create "%where_shortcuts%\wterm.lnk" "%where_terminal%" -wd ""
call shortcut-create "%where_shortcuts%\wterma.lnk" "%where_terminal%" -wd "" -ra
