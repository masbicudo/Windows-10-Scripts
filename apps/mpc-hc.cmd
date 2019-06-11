call require apps/choco.cmd
call require places

choco upgrade -y mpc-hc

:: create icons in shortcuts folder
set-where "where_mpchc64" "mpc-hc64"
shortcut-create "%where_shortcuts%\mpc.lnk" "%where_mpchc64%"
shortcut-create "%where_shortcuts%\mpchc.lnk" "%where_mpchc64%"
shortcut-create "%where_shortcuts%\mpc-hc.lnk" "%where_mpchc64%"
shortcut-create "%where_shortcuts%\mpc-hc64.lnk" "%where_mpchc64%"

:: remove icon from desktop (move it to shortcuts folder)
call rm-desktop-link "MPC-HC x64"
