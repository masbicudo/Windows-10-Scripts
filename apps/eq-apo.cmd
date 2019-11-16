call require apps\choco.cmd

choco install equalizerapo -y

call set-where where_eq_apo "Editor.exe" --filter "EqualizerAPO"
shortcut-create "%where_shortcuts%\apo.lnk" "%where_eq_apo%"
