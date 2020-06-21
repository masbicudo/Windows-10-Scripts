:: ref: https://www.tenforums.com/tutorials/119220-turn-off-presentation-mode-windows.html
:: ref: https://superuser.com/questions/90415/prevent-sleep-in-scripts
where PresentationSettings >nul 2>&1 || goto :default_presentation_not_found
  PresentationSettings "/start"
  powercfg -requests
  %*
  PresentationSettings "/stop"
  goto :eof
:default_presentation_not_found
echo PresentationSettings not found by where command

if not exist %WINDIR%\System32\PresentationSettings.exe goto :sys32_presentation_not_found
  %WINDIR%\System32\PresentationSettings.exe "/start"
  powercfg -requests
  %*
  %WINDIR%\System32\PresentationSettings.exe "/stop"
  goto :eof
:sys32_presentation_not_found
echo PresentationSettings not found at System32 folder

where powercfg >nul 2>&1 || goto :powercfg_not_supported
  for /f "tokens=2 delims=:" %%a in ('powercfg -getactivescheme') do (
    for /f "tokens=1 delims= " %%b in ('echo %%a') do set SCHEME_GUID=%%b
  )
  if "%SCHEME_GUID%"=="" goto :powercfg_not_supported
  for /f "tokens=2 delims=:" %%a in ('powercfg -duplicatescheme %SCHEME_GUID%') do (
    for /f "tokens=1 delims= " %%b in ('echo %%a') do set TMP_GUID=%%b
  )
  if "%TMP_GUID%"=="" goto :powercfg_not_supported
  powercfg -setactive %TMP_GUID%
  powercfg -changename %TMP_GUID% nosleep "temporary scheme for disabling sleep and hibernation"
  powercfg -change -standby-timeout-ac 0
  powercfg -change -hibernate-timeout-ac 0
  %*
  powercfg -setactive %SCHEME_GUID%
  powercfg -delete    %TMP_GUID%
  goto :eof
:powercfg_not_supported
echo powercfg not found by where command
