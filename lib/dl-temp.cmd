call require places.cmd
call require apps\wget.cmd
setlocal
tasklist | find "Fiddler.exe" >nul || goto :no_fiddler
set http_proxy=127.0.0.1:8888
set https_proxy=127.0.0.1:8888
:no_fiddler
pushd "%TEMP%"
echo.1st try (HEAD + optional GET)
:: 1st try
:: - using -N to avoid getting a file that was already downloaded
:: - wget will first do a HEAD request to get info about the file
:: - then, wget compares the info with the local file if present
:: - if the file is not found, it just downloads the file,
:: - if the local file is older, it downloads it again
if     "%~2"=="" wget -N -q --content-disposition --show-progress %1 || goto :retry_1
if not "%~2"=="" wget -N -q --content-disposition --show-progress -O %1 %2 || goto :retry_1
goto :finally
:retry_1
echo.2nd try (GET)
:: 2nd try
:: - just download the file ignoring local downloads
:: - wget will do a GET request straight away
if     "%~2"=="" wget -q --content-disposition --show-progress %1 || goto :failed
if not "%~2"=="" wget -q --content-disposition --show-progress -O %1 %2 || goto :failed
goto :finally
:failed
echo.Download failed!
:finally
popd