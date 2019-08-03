call require apps\choco.cmd
call require places.cmd

choco install -y paint.net

call set-where "where_paintnet" "paintdotnet"
shortcut-create "%where_shortcuts%\pn.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\pdn.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\pnet.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\paintnet.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\paintdotnet.lnk" "%where_paintnet%"

call rm-desktop-link "paint.net"
