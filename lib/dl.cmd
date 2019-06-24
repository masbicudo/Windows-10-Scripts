call require places.cmd
setlocal
pushd "%where_downloads%"
if     "%2"=="" curl -L -O %1
if not "%2"=="" curl -L -o %1 %2
popd