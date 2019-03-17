@ECHO OFF
SETLOCAL EnableDelayedExpansion
FOR /f "usebackq tokens=*" %%a IN (` eat %* `) DO SET TEMP_EAT=%%a
FOR /f "usebackq tokens=*" %%a IN (` %TEMP_EAT% ^|^| SET _DIE=!errorlevel!`) DO SET "__VALUE=%%a"

::echo._DIE=%_DIE%
::echo.__VALUE=%__VALUE%
if defined _DIE %comspec% /c exit %_DIE% & goto :dieerrlvl
if not defined __VALUE %comspec% /c exit 1 & goto :dieerrlvl

ENDLOCAL & SET "%1=%__VALUE%"
%comspec% /c exit 0 & goto :dieerrlvl

:: FOOTER
GOTO :EOF
:dieerrlvl
%comspec% /c exit %errorlevel%