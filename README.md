# Windows x64 build environment snapshot for Pico SDK 2.2.0

This is a binary image snapshot of my Windows x64 command-line
firmware build environment for the Raspberry Pi Pico SDK 2.2.0.

Up through SDK version 1.5.1, Raspberry Pi maintained a one-click
installer for the Windows command-line build environment, at
https://github.com/raspberrypi/pico-setup-windows/.  That has 
since been deprecated, replaced with a VS Code extension, at
https://marketplace.visualstudio.com/items?itemName=raspberry-pi.raspberry-pi-pico.
See also [Getting started with Raspberry Pi Pico](https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf).

I created this snapshot because the VS Code extension still seems to 
be a work-in-progress, to such an extent that I can't even get it to
install on my system.  I tend to prefer a command-line setup anyway,
for more flexibility in selecting editors and other tools, but for now
it seems to be my only option since I can't get the official VS Code
package to work.

## How to install

This snapshot is designed to be fully self-contained, following the
pattern of the official SDK 1.5.1 Windows setup.  There's no
installer; it's just a literal copy of my directory structure.

* Copy this entire directory tree to a location on your hard disk, say c:\pico-sdk-2.2.0

* Open `version.ini` from the newly copied files in a text editor, and change PICO_INSTALL_PATH to match the folder where you installed it

* You'll also need to install NMAKE, which is a proprietary Microsoft program that I can't include here.
  I think the easiest way to get it is to install the free Microsoft Visual Studio Community Edition.


### How to start a session

* Open a Windows command prompt window (CMD.EXE)

* Run `c:\pico-sdk-2.2.0\pico-env.cmd` (replace c:\ with the actual install path)

* Also make sure that NMAKE (from the Microsoft Visual Studio program folder) is in your PATH

* Now you can build your Pico projects with CMAKE and NMAKE per the usual command-line build procedures for the Pico SDK


### Technical details

Notes on how I created this snapshot, and how to replicate it yourself from the original sources:

[Snapshot-Creation-Notes.md](Snapshot-Creation-Notes.md)

## License

Everything here is licensed under the original terms of the third-party source.
It probably goes without saying that the Gnu toolchain tools are all under GPL.
The Pico SDK library source is released under a 3-clause BSD license.


