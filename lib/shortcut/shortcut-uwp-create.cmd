@echo off
setlocal

call set-out __pkg_id programs-uwp-list.cmd %*
::shortcut-create %1 "C:\Windows\explorer.exe" -a "shell:AppsFolder\%__pkg_id%"

shortcut-create %1 "shell:AppsFolder\%__pkg_id%" %*
