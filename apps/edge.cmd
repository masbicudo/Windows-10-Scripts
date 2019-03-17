call require places

setlocal
call rm-desktop-link "microsoft edge"
call shortcut-uwp-create "%where_shortcuts%" --pkg edge --id edge
