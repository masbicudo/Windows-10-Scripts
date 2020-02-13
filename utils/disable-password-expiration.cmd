@echo off
:: ref: https://www.cocosenor.com/articles/windows-10/4-ways-to-disable-or-enable-windows-10-password-expiration-notification.html
wmic UserAccount where Name='masbicudo' set PasswordExpires=False
wmic UserAccount where Name='luiza' set PasswordExpires=False
wmic UserAccount where Name='nicolas' set PasswordExpires=False
