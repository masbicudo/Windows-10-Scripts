@echo off
setlocal
echo.%*
call set-out __pkg_id programs-uwp-list.cmd --pkg edge --id edge
shortcut-create %1 "shell:AppsFolder\%__pkg_id%" %*
