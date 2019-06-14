call require apps\choco.cmd

choco upgrade -y qbittorrent

call set-where "where_qbt" "qbittorrent" --filter "%ProgramFiles%"
shortcut-create "%where_shortcuts%\torrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\torrrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\torent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbit.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qtorrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qtorent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qtorrrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbt.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbitorrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbittorrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbitorent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbittorent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbitorrrent.lnk" "%where_qbt%"
shortcut-create "%where_shortcuts%\qbittorrrent.lnk" "%where_qbt%"
