choco install -y telegram
CALL set-where.bat where_telegram telegram.exe --colors
CALL shortcut-create "%where_shortcuts%\tel.lnk" "%where_telegram%"
:: TODO: remove desktop shct
