call require places.cmd
call require apps\wget.cmd
setlocal
pushd "%where_downloads%"
if     "%2"=="" wget -N --content-disposition -q --show-progress %1
if not "%2"=="" wget -N --content-disposition -q --show-progress -O %1 %2
popd