@echo off
setlocal
set _regex=%~1
set "_regex=\b%_regex: =\b.*\b%\b"
cscript /nologo programs-list.js --filter "(?:^%_regex%$)|(?:^%_regex%)|(?:%_regex%)" 1>nul 2>&1
