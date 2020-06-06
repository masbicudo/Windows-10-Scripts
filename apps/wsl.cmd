call require apps\choco.cmd
call require places.cmd
call require apps\7zip.cmd

meta incompatible "apps\virtualbox.cmd" && goto :eof

::poshca "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"

:: ref: https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

::choco upgrade -y wsl
::choco upgrade -y wsl-archlinux

:: http://www.akitaonrails.com/2018/04/29/running-arch-linux-over-windows-10
curl -O "%where_downloads%\Arch.zip" https://github.com/yuk7/ArchWSL/releases/download/19.11.16.0/Arch.zip
mkdir "%SystemDrive%\Arch"
7z.exe e "%where_downloads%\Arch.zip" -o"%SystemDrive%\Arch"

shortcut-create "%where_shortcuts%\arch.lnk" "%SystemDrive%\Arch\Arch.exe"
shortcut-create "%where_shortcuts%\archa.lnk" "%SystemDrive%\Arch\Arch.exe" -ra


choco install wsl-ubuntu-1804
