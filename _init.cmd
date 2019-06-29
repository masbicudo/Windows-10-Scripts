:: What is this:
:: - Restore Windows 10 configurations
@ECHO OFF
SETLOCAL

:: set working directory to the directory of the current batch file
%~d0 & CD "%~dp0"
call set-env
call is-elevated || ( elevate "%~f0" %* & GOTO :EOF )
:ELEVATED

call set-colors
ECHO.Running in %R%ELEVATED%N% environment at %Y%%CD%%N%
ECHO.%B%Proceed with caution!%N%

SET proceed=
SET /P proceed=Would you like to proceed? %Y%[Y]es/[N]o (default=N)%N%: %W%
IF /I NOT [%proceed%] == [y] (
ECHO.%B%Exiting%N%
GOTO :EOF
)
ECHO %B%Proceeding%N%
SET proceed=

::::::::::::::::::::::::::::
:: index
::::::::::::::::::::::::::::

:: initialization
:: required utilities
:: dev tools
:: user tools

:: TODO - after installing GIT
:: - clone git-scripts project
:: - add git-scripts/src to the PATH

:: TODO
:: - add .LNK to the system PATHEXT

:: context menu for Open Command Prompt with Administrator Privileges Anywhere
regedit /s "utils\cmda_here\Add_Shift+Open_command_window_here_as_administrator.reg"

:: unpin all elements from start menu
:: pin `computer` to start menu
:: pin `recycle bin` to start menu

:: remove Edge shortcut from desktop

:: - add script: set-where variable filename
:: - add script: set-special-folder variable special_folder
:: - add script: set-special-folder variable special_folder

:: - create global shortcuts folder and add it to the system PATH
call require shortcuts_folder.cmd
call require projects_folder.cmd

:: installing chocolatey (package manager for Windows)
call require apps\choco.cmd
call require include/places.cmd

::::::::::::::::::::::::::::
:: translations
::::::::::::::::::::::::::::

call require load-msg.cmd

::::::::::::::::::::::::::::
:: required utilities
::::::::::::::::::::::::::::

:: syspin is used to pin programs to the taskbar and startmenu
call require apps\syspin.cmd

:: everything is used by set-where.cmd script
call apps\everything.cmd

call require apps\setdefaultbrowser.cmd

call require apps\git.cmd

:: should I install all vcredists? or only the needed ones?
call require apps\vcredist.cmd

::::::::::::::::::::::::::::
:: programs
::::::::::::::::::::::::::::

:: - create cmda.lnk command (cmd as administrator)
shortcut-create "%where_shortcuts%\cmda.lnk" %ComSpec% -wd "" -ra

call require apps\grepwin.cmd

call require apps\freefonts.cmd
call require apps\notepad++.cmd

call require apps\kdiff.cmd
call require apps\winmerge.cmd

call require apps\gitextensions.cmd

call require apps\vscode.cmd
call require apps\vs.cmd

call require apps\node.cmd

call require apps\python.cmd
call require apps\jupyter.cmd

call require apps\google-chrome.cmd
call require apps\edge.cmd

call require apps\anydesk.cmd

call require apps\telegram.cmd
