@echo off
if not "%1"=="" if not "%1"=="--help" if not "%1"=="-h" if not "%1"=="/?" if not "%1"=="?" goto :skip_help
:help
echo.Parameters:
echo.-iA  install vscode stable and insiders, and their options
echo.-iS  install vscode stable, and it's options
echo.-iI  install vscode insiders, and it's options
echo.-ibS install vscode stable only
echo.-ixS install vscode stable extensions only
echo.-icS install vscode stable config only
echo.-isS install vscode stable shortcuts only
echo.-ibI install vscode insiders only
echo.-ixI install vscode insiders extensions only
echo.-icI install vscode insiders config only
echo.-isI install vscode insiders shortcuts only
goto :eof
:skip_help


call require apps\choco.cmd
call require places.cmd
call require iecho.cmd

setlocal

:: colors
call set-colors.cmd web abbr
set TC=%web_mediumaquamarine%

:: locations
call set-where where_noshell "noshell.vbs"
call set-where where_wscript "wscript.exe" --filter %windir%

if "%1"=="" goto :-iA
:next_param
call :%1
shift
if "%1"=="" goto :eof
goto :next_param

:: install all vscode options, including insiders
goto :eof
:-i
:-iA
:install-vscode-all
iecho %TC%install-vscode-all%N%

    call :-ifS
    call :-ifI

:: install vscode (stable) and all complements
goto :eof
:-iS
:-ifS
:install-vscode-stable-full
iecho %TC%install-vscode-stable-full%N%

    call :-ibS
    call :-ixS
    call :-icS
    call :-isS

:: install vscode insiders and all complements
goto :eof
:-iI
:-ifI
:install-vscode-insiders-full
iecho %TC%install-vscode-insiders-full%N%

    call :-ibI
    call :-ixI
    call :-icI
    call :-isI

:: vscode (stable)
goto :eof
:-ibS
:install-vscode
iecho %TC%install-vscode%N%

    choco upgrade -y vscode

goto :eof
:-ixS
:install-vscode-extensions
iecho %TC%install-vscode-extensions%N%

    code --install-extension formulahendry.code-runner

goto :eof
:-icS
:install-vscode-config
iecho %TC%install-vscode-config%N%

    if exist "%where_appdata%\Code\User\settings.json" goto :skip_settings
        mkdir "%where_appdata%\Code\User"
        copy "res\vscode.%__user%\settings.json" "%where_appdata%\Code\User"
    :skip_settings

goto :eof
:-isS
:install-vscode-shortcuts
iecho %TC%install-vscode-shortcuts%N%

    call rm-desktop-link Visual Code
    call set-where where_vscode "Microsoft VS Code\bin\code.cmd" --filter %ProgramFiles%
    call set-where where_vscode_exe "Microsoft VS Code\code.exe" --filter %ProgramFiles%
    shortcut-create "%where_shortcuts%\code.lnk" "%where_wscript%" -i "%where_vscode_exe%,0" -wd "" -a "%where_noshell%" "%where_vscode%"
    shortcut-create "%where_shortcuts%\coda.lnk" "%where_wscript%" -ra -i "%where_vscode_exe%,0" -wd "" -a "%where_noshell%" "%where_vscode%"

:: vscode insiders
goto :eof
:-ibI
:install-vscode-insiders
iecho %TC%install-vscode-insiders%N%

    ::choco install -y vscode-insiders --version 1.30 --ignore-checksums
    :: TODO: use curl to download https://aka.ms/win32-x64-user-insider
    ::       https://go.microsoft.com/fwlink/?Linkid=852155
    SET url_x64_user_insider=https://aka.ms/win32-x64-user-insider
    SET url_x86_user_insider=https://aka.ms/win32-user-insider
    SET url_x64_system_insider=https://go.microsoft.com/fwlink/?Linkid=852155
    SET url_x86_system_insider=https://go.microsoft.com/fwlink/?LinkId=723965
    echo x
    pushd %where_downloads%
    IF     DEFINED ProgramFiles^(x86^) call dl.cmd "%url_x64_system_insider%"
    IF NOT DEFINED ProgramFiles^(x86^) call dl.cmd "%url_x86_system_insider%"
    popd
    echo x2
    call set-out.cmd where_vscode_insiders_installer es.exe "VSCodeSetup-" "-insider" *.exe
    %where_vscode_insiders_installer% /CLOSEAPPLICATIONS /VERYSILENT /MERGETASKS=!runcode

goto :eof
:-ixI
:install-vscode-insiders-extensions
iecho %TC%install-vscode-insiders-extensions%N%

goto :eof
:-isI
:install-vscode-insiders-shortcuts
iecho %TC%install-vscode-insiders-shortcuts%N%

    call set-where where_vsicode "code-insiders.cmd" --filter %ProgramFiles%
    call set-where where_vsicode_exe "Code - Insiders.exe" --filter %ProgramFiles%
    shortcut-create "%where_shortcuts%\icode.lnk" "%where_wscript%" -i "%where_vsicode_exe%,0" -wd "" -a "%where_noshell%" "%where_vsicode%"
    shortcut-create "%where_shortcuts%\icoda.lnk" "%where_wscript%" -ra -i "%where_vsicode_exe%,0" -wd "" -a "%where_noshell%" "%where_vsicode%"

goto :eof
:-icI
:install-vscode-insiders-config
iecho %TC%install-vscode-insiders-config%N%

    if exist "%where_appdata%\Code - Insiders\User\settings.json" goto :skip_settings
        mkdir "%where_appdata%\Code - Insiders\User"
        copy "res\vsicode.%__user%\settings.json" "%where_appdata%\Code - Insiders\User"
    :skip_settings
