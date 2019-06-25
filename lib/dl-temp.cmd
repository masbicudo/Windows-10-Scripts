call require apps\wget.cmd
setlocal
pushd "%TEMP%"
if     "%2"=="" wget -N --content-disposition -q --show-progress %1
if not "%2"=="" wget -N --content-disposition -q --show-progress -O %1 %2
popd