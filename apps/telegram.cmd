call require set-env.cmd
call require places.cmd
call require apps\choco.cmd

choco upgrade -y telegram
call rm-desktop-link Telegram

call set-where.cmd where_telegram telegram.exe --colors
shortcut-create "%where_shortcuts%\tel.lnk" "%where_telegram%"
shortcut-create "%where_shortcuts%\telegram.lnk" "%where_telegram%"
