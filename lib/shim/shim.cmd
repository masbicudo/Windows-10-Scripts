:: shim.cmd
::
::     This is used to create a shim for a given file.
:: A shim is an executable program that call the target file,
:: as if the user had started it himself.
:: Shims can target any kind of file, because they will start
:: the file by using the default associated program to start it.
:: This means that the OS will determine what program will be used
:: to start the given file. Another method that can be used, it
:: to use CreateProcess API to start a specific process, passing
:: some arguments to open the given file, or, if the target is
:: an executable, CreateProcess can start it directly.
::
::     This tool works by creating a custom C file that has code to
:: start the given file. The shim will have the given path of the
:: shimmed file hard-coded, so the target file cannot be moved
:: elsewhere. If the target is moved, then the shim will have to
:: be recompiled.
::
::     The C file will be compiled using GCC, a free C compiled.
:: GCC will be installed, if not present by using Chocolatey.
:: Chocolatey will be installed if not present.
::
:: # Command line
:: 
:: shim.cmd [shim-options] target_file | [options]
:: options:
:: -h, --help       shows the help
:: shim-options:
:: -i, --icon       icon_path
:: -i, --icon       icon_number
:: -d, --desc       description
:: -s, --async      start the target and returns immediately
:: -e, --elevated   start the program elevated
:: -wd, --work-dir  where to start the file from
:: -h, --hidden     hides any GUI that is opened
:: -m, --method S|C One of the possible methods: System or CreateProcess
:: -a, --args

:: https://stackoverflow.com/questions/42531/how-do-i-call-createprocess-in-c-to-launch-a-windows-executable
:: https://github.com/chocolatey/shimgen/blob/master/shim/CommandExecutor.cs
