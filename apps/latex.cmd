@echo off
call meta title "LaTeX"

if not "%1"=="" goto :%1

:: if "tlmgr" exists, then use it to update current install
:: otherwise, just do a fresh install
where tlmgr >nul 2>&1 && call :update-texlive || call :install-texlive

goto :eof
:install-texlive
call meta option install "TeX Live"

    :: ISO installer
    if exist "%SystemDrive%\texlive\iso" goto :skip_dl_extract_iso
        if exist "%where_downloads%\texlive.iso" goto :skip_dl_iso
            curl -L -o "%where_downloads%\texlive.iso" "http://mirror.ctan.org/systems/texlive/Images/texlive.iso"
            set "where_texlive_dl=%where_downloads%\texlive.iso"
        :skip_dl_iso
        call require apps\7zip.cmd
        7z x "%where_texlive_dl%" -o"%SystemDrive%\texlive\iso\" -y
    :skip_dl_extract_iso

    call %SystemDrive%\texlive\iso\install-tl-windows.bat -no-gui -profile "%~dp0..\res\texlive\texlive.profile"

goto :eof
:update-texlive
call meta option update "TeX Live"

    call tlmgr update --self --all --reinstall-forcibly-removed
