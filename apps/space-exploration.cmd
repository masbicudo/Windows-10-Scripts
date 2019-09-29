@echo off
call meta title "Space Exploration"

if not "%1"=="" goto :%1

call :install-gaiasky
call :install-celestia
call :install-universe_sandbox
call :install-spaceengine

goto :eof
:install-gaiasky
call meta install "Gaia Sky"

    :: https://zah.uni-heidelberg.de/institutes/ari/gaia/outreach/gaiasky/downloads
    :: http://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/2.1.7.a67779dc/gaiasky_windows-x64_2_1_7_a67779dc.exe

    setlocal enabledelayedexpansion
    del "%TEMP%\gsdl.html"
    curl -L -o "%TEMP%\gsdl.html" https://zah.uni-heidelberg.de/institutes/ari/gaia/outreach/gaiasky/downloads
    if exist "%TEMP%\gsdl.html" (
        call set-out gaiasky64 match "https?://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/.*/(.*windows-x64_.*\.exe)" -f "%TEMP%\gsdl.html" -s 1
        call set-out gaiasky32 match "https?://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/.*/(.*windows_.*\.exe)" -f "%TEMP%\gsdl.html" -s 1
        call set-out www_gaiasky64 match "https?://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/.*/(.*windows-x64_.*\.exe)" -f "%TEMP%\gsdl.html"
        call set-out www_gaiasky32 match "https?://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/.*/(.*windows_.*\.exe)" -f "%TEMP%\gsdl.html"
        call set-where where_gaiasky64_dl "!gaiasky64!" --clear
        if not defined where_gaiasky64_dl (
            curl -L -o "%where_downloads%\!gaiasky64!" !www_gaiasky64!
            set where_gaiasky64_dl=%where_downloads%\!gaiasky64!
        )
    )
    endlocal & set where_gaiasky64_dl=%where_gaiasky64_dl%

    start /wait cmd /c "%where_gaiasky64_dl%" -q -c

    set-where "where_gaiasky" "gaiasky.exe"
    shortcut-create "%where_shortcuts%\gaia.lnk" "%where_gaiasky%"
    shortcut-create "%where_shortcuts%\gaiasky.lnk" "%where_gaiasky%"
    shortcut-create "%where_shortcuts%\gsky.lnk" "%where_gaiasky%"
    shortcut-create "%where_shortcuts%\sky.lnk" "%where_gaiasky%"
    shortcut-create "%where_shortcuts%\gs.lnk" "%where_gaiasky%"

goto :eof
:install-celestia
echo install-celestia
call meta install "Celestia"

    set-where "where_celestia" "celestia.exe"
    shortcut-create "%where_shortcuts%\celestia.lnk" "%where_celestia%"
    shortcut-create "%where_shortcuts%\celestial.lnk" "%where_celestia%"
    shortcut-create "%where_shortcuts%\celest.lnk" "%where_celestia%"
    shortcut-create "%where_shortcuts%\cel.lnk" "%where_celestia%"
    shortcut-create "%where_shortcuts%\ceu.lnk" "%where_celestia%"
    rm-desktop-link "Celestia.lnk"

goto :eof
:install-spaceengine
echo install-spaceengine
call meta create-links "Space Engine"

    :: creating links only... this softwares must be installed by hand via steam
    :: #TODO - should I install the game using the command 'steam steam://install/appid'?

    set-where "where_spaceengine" "SpaceEngine.exe"
    shortcut-create "%where_shortcuts%\SpaceEngine.lnk" "%where_spaceengine%"
    shortcut-create "%where_shortcuts%\se.lnk" "%where_spaceengine%"
    shortcut-create "%where_shortcuts%\sengine.lnk" "%where_spaceengine%"
    shortcut-create "%where_shortcuts%\spacee.lnk" "%where_spaceengine%"
    shortcut-create "%where_shortcuts%\spceng.lnk" "%where_spaceengine%"
    shortcut-create "%where_shortcuts%\space.lnk" "%where_spaceengine%"
    rm-desktop-link "SpaceEngine 0.980.lnk"
    rm-desktop-link "SpaceEngine.url"

goto :eof
:install-universe_sandbox
echo install-universe_sandbox
call meta create-links "Universe Sandbox"

    :: creating links only... this softwares must be installed by hand via steam
    :: #TODO - should I install the game using the command 'steam steam://install/appid'?

    set-where "where_universe_sandbox" "Universe Sandbox x64.exe" --filter "Universe Sandbox 2"
    shortcut-create "%where_shortcuts%\universe sandbox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\unisandbox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\unisbox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\unibox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\usbox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\usandbox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\usbox.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\us2.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\usb2.lnk" "%where_universe_sandbox%"
    shortcut-create "%where_shortcuts%\universe.lnk" "%where_universe_sandbox%"
    rm-desktop-link "Universe Sandbox.url"

goto :eof
:install-google_earth
echo install-google_earth
call meta install "Google Earth"

    choco install -y googleearth
