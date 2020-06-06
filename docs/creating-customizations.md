# Creating customization scripts

Creating a new `.cmd` file inside the `apps` folder will automatically
add a new system customization to the repository.

## Environment setup

Before running any customization script, the setup script `set-env.cmd`
must be run in the root of this project.

It will install prerrequisites and add some pathes to PATH variable.

## Importing requirements

Customization scripts can import requirements such as libs, other utility files,
and even other customizations from the apps directory.

### Importing `choco`

For example, the following line will make sure that `Chocolatey` is
installed and ready to be called via `choco` command.

    call require apps\choco.cmd

Then the script can call `choco` package manager:

    choco upgrade -y 7zip

Don't use `choco install` since it can't be used to update existing
software. `choco upgrade` can be used to install a new app and also
update it.

### Importing another customization script

Example - importing 7-zip to use `7z.exe`:

    call require apps\7zip.cmd

## Installing applications

I use `Chocolatey` as the main package manager to install the apps I like.
This is not always possible though.
Sometimes I have to download the installer directly,
and other times I have to parse HTML to find the correct link to download.

### Chocolatey

- Importing:
    ```
    call require apps\choco.cmd
    ```

- Running:
    ```
    choco upgrade -y 7zip
    ```

## Shortcuts

I generally manage shortcuts for apps following these guidelines:

- Create shortcuts inside the global Shortcuts folder with multiple aliases for the same app
- Move all shortcuts created on the `Desktop` to the global Shortcuts folder

### Global Shortcuts folder

The global Shortcuts folder can be used after importing `places`:

    call require places

Using the Shortcuts folder:

- Copying shortcuts and replacing target by default:
    ```
    copy /Y "%source_lnk%" "%where_shortcuts%\"
    ```
- Copying shortcuts with new name:
    ```
    copy /Y "%source_lnk%" "%where_shortcuts%\new_name.lnk"
    ```

## Locating installed shortcuts and applications

Use `set-where` utility to set a variable with the location of a file
given as a search criteria.

To get help on how to use `set-where`:

    set-where --help

Locating a shortcut file inside the Start Menu:

    call set-where "where_adobe_reader_lnk" "Acrobat Reader DC.lnk" --filter "Start Menu"

Locating an executable file:

    call set-where where_anydesk "AnyDesk.exe"

## Extracting parts of a path

Use `set-dpnx` script to extract parts of a path.
The path can be relative or absolute, it makes no difference,
since relative paths are completed automatically.

    set-dpnx variable_name path dpnx

DPNX options:

- `d` drive letter
- `p` path
- `n` file-name
- `x` extension

See more with `set-dpnx --help`

### Removing shortcuts from Desktop

Use the `rm-desktop-link` script to move desktop shortcuts containing
the specified search substring to the Shortcuts global folder.

    call rm-desktop-link "anydesk"

Only shortcut files are selected though. If the installer placed
anything else on the desktop, this script will not see it.

### Creating new shortcuts

Use the `shortcut-create` script in combination with `set-where`, to find the target executable and create a shortcut to that target:

    call set-where where_anydesk "AnyDesk.exe"
    shortcut-create "%where_shortcuts%\any.lnk" "%where_anydesk%"

The script supports a wide variety of parameters:

- `-i`: icon path to use; or number if target has embedded icons
- `-d`: description that appears as tool-tip
- `-hk`: hotkeys, e.g.: `"ALT+CTRL+X"` must pass with double quotes
- `-ws`: window-styles: Normal, Maximized or Minimized
- `-wd`: work-dir
- `-ra`: run as administrator
- `-a`: everything after this parameter is passed as arguments to the target

Universal Windows Platform application links can also be created with
`shortcut-uwp-create` script:

    call shortcut-uwp-create "%where_shortcuts%\edge.lnk" --pkg edge --id edge

## Metadata inside files

Metadata can be added into the `.cmd` files in order to give more
information about the specific customization.

### Title

Title metadata is used as the display name for customizations.

    meta title "DBeaver"

Title is searchable.

### Tags

Tags metadata are used to group customizations logically
without regard for hierarchy.

    meta tags "db" "database" "administration" "tool"

Tags are searchable.

### Option

Option is used to indicate that the customization script can be
called passing the given option sequence. The argument is then
used when calling the script, that must imediately direct the
execution flow to where the `meta option` is placed. Be careful
of instructions that may cause side-effects before reaching the
code of the specified option.

    :install-programname
    meta option install "Program Name"

A common option to provide is the `remove`:

    :remove
    meta option remove

A great way to start a customization script supporting
options is below. This startup script assumes that a label
is placed just before the `meta option` command, in the
format seen in the previous examples.

    if not "%1"=="" goto :%1

### Incompatible

Incompatible is an active metadata that serves to indicate the
incompatibility with another customization, and also tests on
run-time if the other customization is in the execution list.

The command must be exactly as follows:

    meta incompatible "apps\virtualbox.cmd" && goto :eof

If `meta option` is used, then `meta incompatible` that comes
after the given option are specific to that option.
Any `meta incompatible` that comes before the first option
are assumed to be for all possible options in the
customization script.

To indicate a incompatible option:

    meta incompatible "apps\other.cmd install-subset" && goto :eof

A require to another customization automatically makes the
given customization incompatible with the `app\other.cmd remove`.

## Installing fonts

Use `font-install` to install font files into the system:

    font-install path_to_font_file

This is a Windows Script Host script, so no need to use `call`.

## Uncompressing

Windows 10 comes with `tar` to uncompress files:

    tar -zxvf source -C target_location

[Tar and Curl Come to Windows!](https://devblogs.microsoft.com/commandline/tar-and-curl-come-to-windows/)

## Downloading

Windows 10 comes with `curl` to download files:

    curl -o target_file source_uri

[Tar and Curl Come to Windows!](https://devblogs.microsoft.com/commandline/tar-and-curl-come-to-windows/)

## Creating tasks

    SCHTASKS /DELETE /TN "\TaskName" /F
    SCHTASKS /CREATE /SC ONLOGON /TN "\TaskName" /TR "\"path_to_run\"" /RL HIGHEST /F

## Useful customizations to import

### PowerShell

Sometimes, PowerShell must be used in the scripts.
By requiring `apps\posh.cmd` you can then use specially crafted
PowerShell starters:

- `poshc`: runs an inline powershell script
- `poshca`: runs an inline powershell script as administrator

### Syspin

TODO: Must test this program... I think it doesn't work anymore!

    call require apps\syspin.cmd
    syspin "%where_shortcuts%\chrome-masb.lnk" c:5386

Options:

- c:5386  : Pin to taskbar
- c:5387  : Unpin from taskbar
- c:51201 : Pin to start
- c:51394 : Unpin to start

### Set Default Browser

    setdefaultbrowser chrome

### Python

    call require apps\python.cmd
