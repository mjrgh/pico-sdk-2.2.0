# Windows x64 build environment snapshot for Pico SDK 2.2.0

This is a binary image snapshot of my Windows x64 command-line
firmware build environment for the Raspberry Pi Pico SDK 2.2.0.
I created this specifically for my [Pinscape Pico](https://github.com/mjrgh/PinscapePico) project,
but it's just the generic Pico SDK 2.2.0 - you can use it to
build any Pico project.

The motivation for creating this snapshot is that I was unable to get
the official 2.1.0 SDK from Raspberry Pi to install properly on
Windows.  Raspberry Pi started packaging the SDK as of v2.1.0 as a VS
Code extension package rather than as a native Windows installer, and
for whatever reason, that just didn't work on my machine.  I
discovered that many other people were reporting similar problems, so
I decided not to waste more time on that, and just installed the SDK
from source instead.  I don't know if the VS Code problems carried
over into 2.2.0, but I don't really care, since I was able to apply
the same install-from-source procedure from 2.1.0.  The install-from-source
procedure is straightforward but tedious, so I thought I'd post a snapshot
here to save other people the trouble.

The official VS Code installer can be found at
https://marketplace.visualstudio.com/items?itemName=raspberry-pi.raspberry-pi-pico.
See also [Getting started with Raspberry Pi Pico](https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf).


## How to install this snapshot

This snapshot is designed to be self-contained, following the pattern
of the old official SDK 1.5.1 Windows setup (the last one that worked
properly for me).  No installer is needed; this is just a literal copy
of my directory structure, and all you have to do to "install" it is
copy the whole thing into a local folder.

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


