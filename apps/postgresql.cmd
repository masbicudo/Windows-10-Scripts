call require apps\choco.cmd

meta title postgreSQL
meta tags "dbms" "rdbms" "relational" "db" "database"
choco upgrade -y postgresql
:: replace configuration to trust any localhost connection
:: effectively making password not required for any user
set-where "where_pgdata" "pg_hba.conf" dp --filter "data"
copy "%~dp0\..\res\pgsql\pg_hba.conf" "%where_pgdata%\" /Y
call deferred pg_ctl -D "%where_pgdata%" restart -s
