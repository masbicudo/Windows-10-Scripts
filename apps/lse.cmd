call require set-env.cmd
call require apps\choco.cmd

choco upgrade -y linkshellextension --ignore-checksums
choco upgrade -y ln --ignore-checksums
