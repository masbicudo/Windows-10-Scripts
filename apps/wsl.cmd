call require apps\choco.cmd
call require places.cmd
call require apps\7zip.cmd

poshca "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux"

::choco upgrade -y wsl
::choco upgrade -y wsl-archlinux

:: http://www.akitaonrails.com/2018/04/29/running-arch-linux-over-windows-10

if not exist "%SystemDrive%\Arch" (
    if not exist "%where_downloads%\Arch.zip" (
        curl -O "%where_downloads%\Arch.zip" https://github.com/yuk7/ArchWSL/releases/download/19.3.19.1/Arch.zip
    )
    mkdir "%SystemDrive%\Arch"
    7z.exe e "%where_downloads%\Arch.zip" -o"%SystemDrive%\Arch"
)

shortcut-create "%where_shortcuts%\arch.lnk" "%SystemDrive%\Arch\Arch.exe"
shortcut-create "%where_shortcuts%\archa.lnk" "%SystemDrive%\Arch\Arch.exe" -ra
