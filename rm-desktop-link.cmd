@echo off
call require places.cmd

:: TODO: set-out requires the compilation of `eat.c`

setlocal
call set-out __to_move__ es %1 *.lnk -path "%where_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"

call set-out __to_move__ es %1 *.url -path "%where_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"

call set-out __to_move__ es %1 *.lnk -path "%where_public_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"

call set-out __to_move__ es %1 *.url -path "%where_public_desktop%"
if defined __to_move__ call MOVE "%__to_move__%" "%where_shortcuts%\"
