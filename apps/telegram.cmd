call require app/choco.cmd
choco install -y telegram
call set-where.bat where_telegram telegram.exe --colors
shortcut-create "%where_shortcuts%\tel.lnk" "%where_telegram%"
:: TODO: remove desktop shct
