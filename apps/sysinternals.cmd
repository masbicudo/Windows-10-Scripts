@ECHO OFF
IF not "%1"=="" GOTO :%1
call require apps\choco.cmd
call require places.cmd

choco upgrade -y sysinternals

CALL :AcceptEula

GOTO :EOF
:: Suppress EULA
:: https://peter.hahndorf.eu/blog/post/2010/03/07/WorkAroundSysinternalsLicensePopups
:AcceptEula

    setlocal

    :: ansi escape sequences
    :: https://en.wikipedia.org/wiki/ANSI_escape_code
    :: https://www.robvanderwoude.com/ansi.php
    :: https://www.math.upenn.edu/~kazdan/210/computer/ansi.html
    SET E=
    SET G=[92m
    SET N=[0m

    reg.exe ADD HKCU\Software\Sysinternals /v EulaAccepted /t REG_DWORD /d 1 /f >nul 2>&1
    reg.exe ADD HKU\.DEFAULT\Software\Sysinternals /v EulaAccepted /t REG_DWORD /d 1 /f >nul 2>&1

    SET _A="AccessChk";"AccessEnum";"AdExplorer";"AdInsight";"AdRestore";"Autologon";"Autoruns"
    SET _B="BgInfo";"BlueScreen"
    SET _C="CacheSet";"ClockRes";"Contig";"Coreinfo";"Ctrl2cap"
    SET _D="DebugView";"Desktops";"Disk Usage";"Disk2vhd";"DiskExt";"Diskmon";"DiskView"
    SET _E="EFSDump"
    SET _H="Handle";"Hex2dec"
    SET _J="Junction"
    SET _L="LDMDump";"ListDLLs";"LiveKd";"LoadOrder";"LogonSessions"
    SET _M="MoveFile"
    SET _N="NTFSInfo"
    SET _P="PageDefrag";"PendMoves";"PipeList";"PortMon";"ProcDump";"Process Explorer";"Process Monitor";"ProcFeatures";"PsExec";"PsFile";"PsGetSid";"PsInfo";"PsKill";"PsList";"PsLoggedOn";"PsLogList";"PsPasswd";"PsService";"PsShutdown";"PsSuspend";"PsTools"
    SET _R="RAMMap";"RegDelNull";"RegJump";"RootkitRevealer"
    SET _S="SDelete";"ShareEnum";"ShellRunas";"Sigcheck";"Streams";"Strings";"Sync"
    SET _T="TCPView"
    SET _V="VMMap";"VolumeId"
    SET _W="Whois";"WinObj"
    SET _Z="ZoomIt"
    SET _all=%_A%;%_B%;%_C%;%_D%;%_E%;%_H%;%_J%;%_L%;%_M%;%_N%;%_P%;%_R%;%_S%;%_T%;%_V%;%_W%;%_Z%
    <nul set /p =[
    FOR %%C IN (%_all%) DO <nul set /p =%E%[C
    <nul set /p =]%E%[D
    FOR %%C IN (%_all%) DO <nul set /p =%E%[D
    FOR %%C IN (%_all%) DO (
        reg.exe ADD "HKCU\Software\Sysinternals\%%~C" /v EulaAccepted /t REG_DWORD /d 1 /f >nul 2>&1
        reg.exe ADD "HKU\.DEFAULT\Software\Sysinternals\%%~C" /v EulaAccepted /t REG_DWORD /d 1 /f >nul 2>&1
        <nul set /p =%G%*%N%
    )

GOTO :EOF
