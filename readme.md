What is this?
=============

This repository contains Windows 10 initialization scripts.
The purpose is to automate installation of softwares, features and settings to my taste (MASBicudo). At this moment this is far from a fully automated process... but the scripts here can help a lot.

Instructions
============

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

Then you can use `require.cmd` script to call these:
- for example: `require.cmd apps\openssh.cmd`

To Do
=====

- After running a package script, running it again should update the package if needed, or reinstall if damaged.
- A tool to select packages should be provided, and be able to create standalone initialization scripts.
