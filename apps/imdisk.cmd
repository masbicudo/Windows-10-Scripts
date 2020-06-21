:: ImDisk allows to mound virtual disk images and RAM disks.
:: We can use it to make disposable data caches by replacing
:: app cache locations with RAM disks, or hide things inside
:: a virtual image that has to be mounted to reveal its data.

:: TODO: download and install ImDisk Tools

:: Example: replace temp folders
%USERPROFILE%\Temp
%SystemRoot%\TEMP
imdisk -a -f C:\temp-disk -v 1 -P -m C:\Temp
