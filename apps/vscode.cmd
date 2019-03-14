choco install -y vscode
CALL set-where where_vscode "Microsoft VS Code\bin\code.cmd"
CALL set-where where_vscode_exe "Microsoft VS Code\code.exe"
CALL shortcut-create "%where_shortcuts%\code.lnk" "%where_vscode%" -i "%where_vscode_exe%,0"
CALL shortcut-create "%where_shortcuts%\coda.lnk" "%where_vscode%" -ra -i "%where_vscode_exe%,0"
:: TODO: remove desktop shct
code --install-extension formulahendry.code-runner

choco install -y vscode-insiders --version 1.30 --ignore-checksums
:: TODO: locate .exe
:: TODO: create icode.lnk at Microsoft VS Code Insiders\Code - Insiders.exe
:: TODO: create icoda.lnk
:: TODO: remove desktop shct
CALL set-where where_vsicode "\bin\code-insiders.cmd"
