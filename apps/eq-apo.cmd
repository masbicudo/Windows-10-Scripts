call require apps\choco.cmd
choco upgrade -y equalizerapo
call set-where where_eq_apo "Editor.exe" --filter "EqualizerAPO"
shortcut-create "%where_shortcuts%\apo.lnk" "%where_eq_apo%"
