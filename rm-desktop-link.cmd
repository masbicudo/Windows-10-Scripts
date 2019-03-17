call require places

setlocal EnableDelayedExpansion
call set-out __to_move__ es %1 *.lnk -path "%where_desktop%" && call MOVE "!__to_move__!" "%where_shortcuts%\"
call set-out __to_move__ es %1 *.lnk -path "%where_public_desktop%" && call MOVE "!__to_move__!" "%where_shortcuts%\"
