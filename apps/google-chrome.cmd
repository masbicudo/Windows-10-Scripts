call require apps/choco.cmd
choco install -y googlechrome
call set-where where_chrome chrome.exe
call MOVE "%where_public_desktop%\Google Chrome.lnk" "%where_shortcuts%\"
:: chrome links
shortcut-create "%where_shortcuts%\chrome.lnk" "%where_chrome%" -d "%MSG[1]%"
:: chrome profiles links ( old param --user-data-dir="%SystemDrive%\Chrome Users" removed, we will use the default location )
shortcut-create "%where_shortcuts%\chrome-masb.lnk" "%where_chrome%" -a --profile-directory="profile-masbicudo" --no-first-run --no-default-browser-check
shortcut-create "%where_shortcuts%\chrome-luiza.lnk" "%where_chrome%" -a --profile-directory="profile-luiza" --no-first-run --no-default-browser-check
:: http://kolbi.cz/blog/2017/11/10/setdefaultbrowser-set-the-default-browser-per-user-on-windows-10-and-server-2016-build-1607/
setdefaultbrowser chrome
:: c:5386  : Pin to taskbar
:: c:5387  : Unpin from taskbar
:: c:51201 : Pin to start
:: c:51394 : Unpin to start
syspin "%where_shortcuts%\chrome-masb.lnk" c:5386
:: TODO
:: - params
::   - computer_usage: indicates that this script is running on a home or work computer
::   - current_user: name of the current user (e.g. "masbicudo" ou "luiza")
:: - if computer_usage == "home"
::   - create global user-data-dir with current_user profile
::   - pin shortcut for current_user at taskbar
::   - create a script to initialize new Windows users on this computer
