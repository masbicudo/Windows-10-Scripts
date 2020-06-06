call require apps\choco.cmd

meta title "DBeaver"
meta tags "db" "database" "administration" "tool"
choco upgrade -y dbeaver
set-where "where_dbeaver" "dbeaver.exe"
shortcut-create "%where_shortcuts%\db.lnk" "%where_dbeaver%"
shortcut-create "%where_shortcuts%\dbeaver.lnk" "%where_dbeaver%"
