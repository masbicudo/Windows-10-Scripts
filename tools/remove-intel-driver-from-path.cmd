@echo off
:: ref: https://superuser.com/questions/1242486/intel-drivers-add-a-lot-of-entries-to-my-path-what-can-i-delete
call path-remove-contains.cmd "\Intel\iCLS Client\";"\Intel\WiFi\bin\";"\Common Files\Intel\WirelessCommon\";"\Intel\Intel(R) Management Engine Components\"
