call require apps\choco.cmd

choco upgrade -y mysql
choco upgrade -y mysql.workbench

call set-where "where_mysqlwb" "mysqlworkbench" --filter "%ProgramFiles%"
shortcut-create "%where_shortcuts%\wb.lnk" "%where_mysqlwb%"
shortcut-create "%where_shortcuts%\mysqlwb.lnk" "%where_mysqlwb%"
shortcut-create "%where_shortcuts%\workbench.lnk" "%where_mysqlwb%"

:: TODO: create specialized command to execute something if variable is present, or save command for later execution, when the variable will be filled
if defined pwd_root mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '%pwd_root%'"
if not defined pwd_root (
    echo mysql -u root -e ^"ALTER USER 'root'@'localhost' IDENTIFIED BY '^%pwd_root^%'^">finilize.cmd
    echo pwd_root>var_finalize.txt
)
