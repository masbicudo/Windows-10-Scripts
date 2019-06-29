@echo off
call require places.cmd

shortcut-create "%where_shortcuts%\shct.lnk" "%where_shortcuts%"
shortcut-create "%where_shortcuts%\shortcuts.lnk" "%where_shortcuts%"

shortcut-create "%where_shortcuts%\dls.lnk" "%where_downloads%"

shortcut-create "%where_shortcuts%\projs.lnk" "%where_projects%"
shortcut-create "%where_shortcuts%\projects.lnk" "%where_downloads%"
