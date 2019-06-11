call require apps/choco.cmd

:: Usefull to create multiboot BIOS bootable USB drives
choco upgrade -y yumi

:: Usefull to create UEFI bootable USB drives
choco upgrade -y rufus

:: Following software is outdated
::choco upgrade -y easybcd

:: TODO: add icons to the shortcuts folder
