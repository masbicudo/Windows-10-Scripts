call require apps/choco.cmd
call require places

choco upgrade -y adobereader

:: create icon inside shortcuts folder
set-where "where_adobe_reader_lnk" "Acrobat Reader DC.lnk" --filter "Start Menu"
copy /Y "%where_adobe_reader_lnk%" "%where_shortcuts%\reader.lnk"
