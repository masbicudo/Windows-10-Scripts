@echo off
setlocal

cscript /nologo lib/programs/programs-uwp-list.js %* | findstr "!"
