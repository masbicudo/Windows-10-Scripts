call require apps\choco.cmd
call require places.cmd

:: vscode (stable)
    choco install -y vscode
    call set-where where_vscode "Microsoft VS Code\bin\code.cmd" --filter %ProgramFiles%
    call set-where where_vscode_exe "Microsoft VS Code\code.exe" --filter %ProgramFiles%
    shortcut-create "%where_shortcuts%\code.lnk" "%where_vscode%" -i "%where_vscode_exe%,0"
    shortcut-create "%where_shortcuts%\coda.lnk" "%where_vscode%" -ra -i "%where_vscode_exe%,0"

    code --install-extension formulahendry.code-runner

    if exist "%where_appdata%\Code\User\settings.json" goto :skip_settings
        mkdir "%where_appdata%\Code\User"
        copy "res\vscode.%__user%\settings.json" "%where_appdata%\Code\User"
    :skip_settings

:: vscode insiders
    choco install -y vscode-insiders --version 1.30 --ignore-checksums
    call rm-desktop-link Visual Code
    call set-where where_vsicode "code-insiders.cmd" --filter %ProgramFiles%
    call set-where where_vsicode_exe "Code - Insiders.exe" --filter %ProgramFiles%
    shortcut-create "%where_shortcuts%\icode.lnk" "%where_vsicode%" -i "%where_vsicode_exe%,0"
    shortcut-create "%where_shortcuts%\icoda.lnk" "%where_vsicode%" -ra -i "%where_vsicode_exe%,0"

    if exist "%where_appdata%\Code - Insiders\User\settings.json" goto :skip_settings
        mkdir "%where_appdata%\Code - Insiders\User"
        copy "res\vsicode.%__user%\settings.json" "%where_appdata%\Code - Insiders\User"
    :skip_settings
