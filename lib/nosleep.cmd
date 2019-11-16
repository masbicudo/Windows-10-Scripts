:: ref: https://www.tenforums.com/tutorials/119220-turn-off-presentation-mode-windows.html
where PresentationSettings >nul 2>&1 || goto :presentation_not_supported
%WINDIR%\System32\PresentationSettings.exe "/start"
powercfg -requests
%*
%WINDIR%\System32\PresentationSettings.exe "/stop"
goto :eof
:presentation_not_supported
echo PresentationSettings.exe is not supported by this version of Windows
ver