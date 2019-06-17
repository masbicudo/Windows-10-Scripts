call require apps\choco.cmd

choco install -y wps-office-free

call set-where "where_wpsoffice" "ksolaunch"
shortcut-create "%where_shortcuts%\wps.lnk" "%where_wpsoffice%"
shortcut-create "%where_shortcuts%\wpsoffice.lnk" "%where_wpsoffice%"

call set-out "where_wpsoffice_lnk" es "%where_desktop%" WPS Office *.lnk
call set-dpnx n_wps_lnk "%where_wpsoffice_lnk%" n
call rm-desktop-link "%n_wps_lnk%"
