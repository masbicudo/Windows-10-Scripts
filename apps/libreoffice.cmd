call require apps\choco.cmd

choco install -y libreoffice-fresh

call set-where "where_paintnet" "soffice"
shortcut-create "%where_shortcuts%\soffice.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\loffice.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\libre.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\libreoffice.lnk" "%where_paintnet%"
shortcut-create "%where_shortcuts%\libre-office.lnk" "%where_paintnet%"

call set-out "where_loffice_lnk" es "%where_public_desktop%" Libre *.lnk
call set-dpnx n_cmd_exe "%where_loffice_lnk%" n
call rm-desktop-link "%n_cmd_exe%"
