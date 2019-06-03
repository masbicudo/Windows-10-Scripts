call require apps\posh.cmd

:: https://docs.microsoft.com/pt-br/windows-server/administration/openssh/openssh_install_firstuse
poshca "Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0"
poshca "Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"
poshca "Start-Service sshd"
poshca "Set-Service -Name sshd -StartupType 'Automatic'"
