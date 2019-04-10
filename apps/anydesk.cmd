call require apps\choco.cmd
choco install -y anydesk
:: TODO: detect user and restore settings from my repo

call rm-desktop-link anydesk
call set-where where_anydesk "AnyDesk.exe"
shortcut-create "%where_shortcuts%\any.lnk" "%where_anydesk%"
