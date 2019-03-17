call require places

setlocal
call set-out __to_move__ es edge *.lnk -path "%where_desktop%" && call MOVE "%__to_move__%" "%where_shortcuts%\"
