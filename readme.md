What is this?
=============

This repository contains Windows 10 initialization scripts.
The purpose is to automate installation of softwares, features and settings to my taste (MASBicudo).
At this moment this is far from a fully automated process... but the scripts here can help a lot.

Most scripts are based on Chocolatey, a package manager for Windows,
and also a miriad of other scripts and utilities either gathered from the Internet or made by me.
Also, native Windows features can be used, if present.

There is no intention on using a specific coding language here.
Most is writen in Windows Batch Script language, but there is also C, VBScript, JScript, Bash, MSHTA,
and there may be anything that comes in handy at each situation.


Instructions
============

## Running GUI

I'm creating a GUI interface for this based on MSHTA.
Run the following command to start the HTA application:

    mshta https://www.masbicudo.com/Windows-10-Scripts/app.hta

MSHTA is safe as long as you **trust** the source code you are executing.
Please, read the source code before running, and see for yourself that there is no malicious code inside.

## Running fully automated setup

The `_init.cmd` is the root setup file.
At this moment it is just a prototype, and <font color="red">SHOULD NOT</font> be used.

The idea is that it will be built by an external tool,
and then run to setup everything. It will have these functions:
- setup environment for installation scripts
- call the installation scripts for the needed packages

## Running individual packages

All important things are inside the `apps` folder. These are small scripts that install software, enable features and tweak settings.
They depend on structural scripts and programs that are in the root of the project.

To run any of these, you need to prepare the environment first:
- run `set-env.cmd`
- run `places.cmd`

Then you can use `require.cmd` script to call these:
- for example: `require.cmd apps\openssh.cmd`


## Authoring package installers and custom system settings

Creating new procedures to install and/or customize the system is very simple.
Just create a new `.cmd` file inside the `apps` folder.
The manager application will read the available files and display them to the user.
Inside each file, there can be meta information to give further info:

    meta option action "Program Name"

These are used as markers inside the file to locate different options.
They must follow a label that will be used as argument for the script
to go to that option.

To Do
=====

See [to do lists](todo.md)
