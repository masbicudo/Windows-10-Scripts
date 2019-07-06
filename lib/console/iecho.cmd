call require apps\mingw.cmd

call set-where where_gcc gcc.exe

pushd %~dp0
:: Predictable builds
:: ==================
:: [Google search: gcc PE header timestamp](https://www.google.com/search?q=gcc+PE+header+timestamp)
:: [Reproducible Builds - Timestamps In PE Binaries](https://wiki.debian.org/ReproducibleBuilds/TimestampsInPEBinaries)
:: [Difference in md5sums in two object files](https://stackoverflow.com/questions/21233386/difference-in-md5sums-in-two-object-files)
::
:: -Os Optimizes the code for minimum size
:: -O3 Optimizes the code for maximum speed without detrimental behaviour
:: -Ofast Optimizes the code for maximum speed with detrimental behaviour
:: -frandom-seed Where GCC needs a random value, use the given seed
:: -s Strip metadata from the build
:: -Xlinker --no-insert-timestamp Linker parameter to not add a timestamp to the Portable Executable COFF header
%where_gcc% -Ofast -frandom-seed=string -s -Xlinker --no-insert-timestamp iecho.c -o iecho.exe
popd

setlocal
set "__IND=::::"
iecho Testing indented echo command `iecho.exe`
