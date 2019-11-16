call require apps\choco.cmd

:: postgreSQL
    choco upgrade -y postgresql

    :: replace configuration to trust any localhost connection
    :: effectively making password not required for any user
    set-where "where_pgdata" "pg_hba.conf" dp --filter "data"
    copy "%~dp0\..\res\pgsql\pg_hba.conf" "%where_pgdata%\" /Y
    call deferred pg_ctl -D "%where_pgdata%" restart -s

:: pgAdmin4
    choco upgrade -y pgadmin4
    set-where "where_pgadmin4" "pgadmin4.exe"
    shortcut-create "%where_shortcuts%\pg.lnk" "%where_pgadmin4%" -ra
    shortcut-create "%where_shortcuts%\pgadmin.lnk" "%where_pgadmin4%" -ra
    shortcut-create "%where_shortcuts%\pgadmin4.lnk" "%where_pgadmin4%" -ra

:: DBeaver
    choco upgrade -y dbeaver
    set-where "where_dbeaver" "dbeaver.exe"
    shortcut-create "%where_shortcuts%\db.lnk" "%where_dbeaver%"
    shortcut-create "%where_shortcuts%\dbeaver.lnk" "%where_dbeaver%"

:: SQLite
    choco upgrade -y sqlite
