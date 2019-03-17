call require places

setlocal

call rm-desktop-link "microsoft edge"
call shortcut-uwp-create "%where_shortcuts%\edge.lnk" --pkg edge --id edge
