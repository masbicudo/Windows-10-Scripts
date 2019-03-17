@echo off
setlocal

cscript /nologo programs-uwp-list.js %* | findstr "!"
