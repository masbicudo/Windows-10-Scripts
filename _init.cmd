:: What is this:
:: - Restore Windows 10 configurations
@ECHO OFF
SETLOCAL

:: set working directory to the directory of the current batch file
%~d0 & CD "%~dp0"
CALL set-env
CALL is-elevated || ( elevate "%~f0" %* & GOTO :EOF )
:ELEVATED

CALL set-colors
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



:: TODO
:: - add .LNK to the system PATHEXT

:: context menu for Open Command Prompt with Administrator Privileges Anywhere
regedit /s "utils\cmda_here\Add_Shift+Open_command_window_here_as_administrator.reg"

:: unpin all elements from start menu
:: pin `computer` to start menu
:: pin `recycle bin` to start menu

:: remove Edge shortcut from desktop

:: - add script: set-where variable filename
:: - add script: set-user-special-folder variable special_folder
:: - add script: set-common-special-folder variable special_folder

:: - create global shortcuts folder and add it to the system PATH
SET where_shortcuts=%SystemDrive%\Shortcuts
mkdir "%where_shortcuts%" 2>nul
:: TODO: add shortcuts folder to the system PATH

:: installing chocolatey (package manager for Windows)
CALL REQUIRE app/choco.cmd

CALL set-user-special-folder where_desktop desktop
CALL set-common-special-folder where_public_desktop "common desktop"

set where_choco_cache=c:\choco_cache
mkdir %where_choco_cache%
choco config set cacheLocation %where_choco_cache%

CALL set-user-special-folder where_downloads desktop
mkdir %where_choco_cache%

::::::::::::::::::::::::::::
:: translations
::::::::::::::::::::::::::::

CALL load-msg

::::::::::::::::::::::::::::
:: required utilities
::::::::::::::::::::::::::::

:: syspin is used to pin programs to the taskbar and startmenu
choco install -y syspin

:: everything is used by set-where.bat script
call apps\everything.cmd

choco install -y setdefaultbrowser

choco install -y git --params "/GitAndUnixToolsOnPath"

::choco install -y wget

:: should I install all vcredists? or only the needed ones?
choco install vcredist-all

::::::::::::::::::::::::::::
:: programs
::::::::::::::::::::::::::::

:: - create cmda.lnk command (cmd as administrator)
CALL shortcut-create "%where_shortcuts%\cmda.lnk" %ComSpec% -wd "" -ra

CALL REQUIRE apps\kdiff.cmd
CALL REQUIRE apps\winmerge.cmd

CALL REQUIRE apps\gitextensions.cmd

CALL REQUIRE apps\grepwin.cmd

CALL REQUIRE apps\freefonts.cmd
CALL REQUIRE apps\notepad++.cmd

CALL REQUIRE apps\vscode.cmd
CALL REQUIRE apps\vs.cmd

CALL REQUIRE apps\google-chrome.cmd
CALL REQUIRE apps\edge.cmd

CALL REQUIRE apps\anydesk.cmd

CALL REQUIRE apps\python.cmd
CALL REQUIRE apps\jupyter.cmd

CALL REQUIRE apps\telegram.cmd
