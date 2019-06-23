@ECHO OFF
SETLOCAL DisableDelayedExpansion

SETLOCAL EnableDelayedExpansion
FOR /f "usebackq tokens=*" %%a IN (` eat %* `) DO SET TEMP_EAT=%%a
SET TEMP_EAT=%TEMP_EAT:^=^^%
FOR /f "usebackq tokens=*" %%a IN (` %TEMP_EAT% ^|^| SET _DIE=!errorlevel!`) DO ENDLOCAL & SET "__VALUE=%%a" & goto :next
:next

::SET DL=ECHO
SET DL=REM

%DL% varname=%1
%DL% _DIE=%_DIE%
%DL% __VALUE=%__VALUE%
if defined _DIE %comspec% /c exit %_DIE% & goto :dieerrlvl
if not defined __VALUE %comspec% /c exit 1 & goto :dieerrlvl

ENDLOCAL & SET "%~1=%__VALUE%"
%comspec% /c exit 0 & goto :dieerrlvl

:: FOOTER
GOTO :EOF
:dieerrlvl
%comspec% /c exit %errorlevel%
