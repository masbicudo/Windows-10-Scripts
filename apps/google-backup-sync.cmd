call require apps\choco.cmd

choco upgrade -y google-backup-and-sync --ignore-checksums

call rm-desktop-link "Google Sheets.lnk"
call rm-desktop-link "Google Docs.lnk"
call rm-desktop-link "Google Slides.lnk"
