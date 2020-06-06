call require apps\choco.cmd

meta title "pgAdmin4"
meta tags "db" "database" "administration" "tool"
choco upgrade -y pgadmin4
set-where "where_pgadmin4" "pgadmin4.exe"
shortcut-create "%where_shortcuts%\pg.lnk" "%where_pgadmin4%" -ra
shortcut-create "%where_shortcuts%\pgadmin.lnk" "%where_pgadmin4%" -ra
shortcut-create "%where_shortcuts%\pgadmin4.lnk" "%where_pgadmin4%" -ra
