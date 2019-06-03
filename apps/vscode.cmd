call require apps\choco.cmd
call require places.cmd

call set-where where_noshell "noshell.vbs"

call set-where where_wscript "wscript.exe" --filter %windir%

:: vscode (stable)
    choco install -y vscode
    call set-where where_vscode "Microsoft VS Code\bin\code.cmd" --filter %ProgramFiles%
    call set-where where_vscode_exe "Microsoft VS Code\code.exe" --filter %ProgramFiles%
    shortcut-create "%where_shortcuts%\code.lnk" "%where_wscript%" -i "%where_vscode_exe%,0" -a "%where_noshell%" "%where_vscode%"
    shortcut-create "%where_shortcuts%\coda.lnk" "%where_wscript%" -ra -i "%where_vscode_exe%,0" -a "%where_noshell%" "%where_vscode%"

    code --install-extension formulahendry.code-runner

    if exist "%where_appdata%\Code\User\settings.json" goto :skip_settings
        mkdir "%where_appdata%\Code\User"
        copy "res\vscode.%__user%\settings.json" "%where_appdata%\Code\User"
    :skip_settings

:: vscode insiders

    ::choco install -y vscode-insiders --version 1.30 --ignore-checksums
    :: TODO: use curl to download https://aka.ms/win32-x64-user-insider
    ::       https://go.microsoft.com/fwlink/?Linkid=852155
    call rm-desktop-link Visual Code
    call set-where where_vsicode "code-insiders.cmd" --filter %ProgramFiles%
    call set-where where_vsicode_exe "Code - Insiders.exe" --filter %ProgramFiles%
    shortcut-create "%where_shortcuts%\icode.lnk" "%where_wscript%" -i "%where_vsicode_exe%,0" -a "%where_noshell%" "%where_vsicode%"
    shortcut-create "%where_shortcuts%\icoda.lnk" "%where_wscript%" -ra -i "%where_vsicode_exe%,0" -a "%where_noshell%" "%where_vsicode%"

    if exist "%where_appdata%\Code - Insiders\User\settings.json" goto :skip_settings
        mkdir "%where_appdata%\Code - Insiders\User"
        copy "res\vsicode.%__user%\settings.json" "%where_appdata%\Code - Insiders\User"
    :skip_settings
