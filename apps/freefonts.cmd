call require places.cmd
call require apps\7zip.cmd

call set-where where_freefonts "freefont-otf-20120503.tar.gz" --clear

if not defined where_freefonts (
    curl -o "%where_downloads%\freefont-otf-20120503.tar.gz" http://ftp.gnu.org/gnu/freefont/freefont-otf-20120503.tar.gz
    set "where_freefonts=%where_downloads%\freefont-otf-20120503.tar.gz"
)
tar -zxvf "%where_freefonts%" -C %TEMP%

FOR %%I in (%TEMP%\freefont-20120503\*.otf) DO (
    @echo Installing font: %%~nxI
    font-install %%I
)
