@echo off
if defined where_shortcuts goto :eof

call require apps\choco.cmd
choco upgrade -y everything
setlocal
call set-out.cmd where_shortcuts es.exe Shortcuts !\program !network !printer !application !amd64 !implicit !\Chrome !\AppData !*.*
endlocal & set "where_shortcuts=%where_shortcuts%"

if defined where_shortcuts goto :eof

SET where_shortcuts=%SystemDrive%\Shortcuts
mkdir "%where_shortcuts%" 2>nul
:: TODO: add shortcuts folder to the system PATH
echo.where_shortcuts=%where_shortcuts%
