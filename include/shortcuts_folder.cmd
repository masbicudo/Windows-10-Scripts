@echo off
if defined where_shortcuts goto :eof

:: if choco is not installed then install it
where choco || call require apps\choco.cmd
:: if everything is not installed then install it
where es || choco install -y everything

setlocal
call set-out.cmd where_shortcuts es.exe Shortcuts !\program !network !printer !application !amd64 !implicit !\Chrome !\AppData !*.*
endlocal & set "where_shortcuts=%where_shortcuts%"

if defined where_shortcuts goto :eof

SET where_shortcuts=%SystemDrive%\Shortcuts
mkdir "%where_shortcuts%" 2>nul
:: TODO: add shortcuts folder to the system PATH
echo.where_shortcuts=%where_shortcuts%
