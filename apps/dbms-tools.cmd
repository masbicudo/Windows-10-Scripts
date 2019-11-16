call require apps\choco.cmd

:: postgreSQL
choco upgrade -y postgresql --params "/Password:'%__PWD__%'"

    :: replace configuration to trust any localhost connection
    :: effectively making password not required for any user
    set-where "where_pghba" "pg_hba.conf" --filter "data"
    copy "%~dp0\..\res\pgsql\pg_hba.conf" "%where_pghba%" /Y

:: pgAdmin4
choco upgrade -y pgadmin4
set-where "where_pgadmin4" "pgadmin4.exe"
shortcut-create "%where_shortcuts%\pg.lnk" "%where_pgadmin4%" -ra

:: DBeaver
choco upgrade -y dbeaver
set-where "where_dbeaver" "dbeaver.exe"
shortcut-create "%where_shortcuts%\db.lnk" "%where_dbeaver%"

:: SQLite
choco upgrade -y sqlite
