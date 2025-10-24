# How I created this snapshot

Just to be clear, **you don't have to repeat these steps** to use the snapshot.
That's the whole point of the snapshot - you just copy it and you're set to go.
I'm documenting the process because it's a certainty that it'll have to be
repeated the next time Raspberry Pi releases a new major Pico SDK update.
I'm hoping that documenting it will save me some time reconstructing what I did.
It also should enable anyone else to make their own updated snapshot, without
having to wait for me to get around to it, in case I don't jump on it the instant
the next SDK comes out.


* Create an empty pico-sdk-2.2.0 folder to serve as the snapshot container

* Create a file called version.ini, containing:
```
[pico-setup-windows]
PICO_SDK_VERSION=2.2.0
PICO_INSTALL_PATH=c:\pico-sdk-2.2.0
PICO_REG_KEY=Software\Raspberry Pi\Pico SDK v2.2.0
```

* Install the Pico SDK 1.5.1
   * https://github.com/raspberrypi/pico-setup-windows/
   * copy the following files and folders into pico-sdk-2.2.0:
       * cmake/
       * git/
       * ninja/
       * openocd/
       * pico-sdk-tools/
       * python/
       * resources/
       * pico-env.cmd
       * ReadMe.txt

* Edit `ReadMe.txt` to add a comment at the top that it's a modified snapshot

* Edit `pico-env.cmd`, find the line `call :AddToPath "%PICO_INSTALL_PATH%\picotool"`, and add `\bin` at the end of the path

* Install the ARM build tools:
   * https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
   * Scroll down to 14.3.Rel1
   * Find the "Windows (mingw-w64-x86_64) hosted cross toolchains" section
   * Run the .exe installer from that list
   * When the installer asks for the destination path, enter `<your sdk path>\gcc-arm-none-eabi`

* Install the 2.2.0 SDK
   * git clone https://github.com/raspberrypi/pico-sdk
   * cd pico-sdk
   * git checkout 2.2.0
   * cd lib\tinyusb
   * git submodule update --init
   * create folder pico-sdk-2.2.0\pico-sdk
   * copy the whole tree, minus the top-level .git/ and .github/ folders, into pico-sdk-2.2.0\pico-sdk

* Build picotool
   * download libUSB from https://libusb.info/, expand somewhere
   * `set LIBUSB_ROOT=<libusb folder you just created>`
   * `git clone https://github.com/raspberrypi/picotool`
   * `git checkout 2.2.0`
   * `mkdir build`
   * `cd build`
   * `cmake -S . -G "NMake Makefiles" ..`
   * `nmake`
   * create folder `<path-to>\pico-sdk-2.2.0\picotool`
   * `cmake --install . --prefix <path-to>\pico-sdk-2.2.0\picotool`

* Build pioasm
   * cd to pico-sdk\tools\pioasm
   * `cmake -S . -G "NMake Makefiles" -DPIOASM_VERSION_STRING=2.2.0`
   * nmake


## Theory of operation

The idea is to set up the 1.5.1 SDK for the Windows tools, then install
the parts that changed in the 2.2.0 SDK:

  - SDK source tree (pico-sdk)
  - Newer ARM Gnu Toolchain (14.3.Rel1)
  - 2.2.0 picotool

The 1.5.1 SDK sets up a bunch of build tools that are needed.  As
always with open-source projects, you need a steaming pile of
Linux-world build tools with specific version numbers, so it's a
nightmare to cobble it all together by hand.  These are third-party
tools like git, ninja, python, and cmake that aren't part of a basic
Windows setup, and which tend to have incompatible changes often
enough that Linux build procedures always insist on *specific*
versions being installed.  It's never enough to have python, you have
to have python 3.6.7.12 exactly, or nothing works.  And all of these
are distributed in source-code form, so you can't just download a 
SETUP program for most of them; you have to download the source and
then build it yourself, which is often difficult on Windows because
the build processes depend on a bunch of Linux-specific tools.  It
becomes a bottomless cascade of tracking down dependencies for the
dependencies.  The magic of the
automated 1.5.1 installer was that it included all of the required
third-party tools at their required version levels, all pre-built and
pre-packaged, so we didn't have to go through the arduous procedure of
finding and installing all of the *additional* build tools needed to
*build the build tools*.  Fortunately, the newer SDK seems happy to
work smoothly with most of the same build tool versions as the older
SDK, so installing the older SDK with its pre-built tools gets us 90%
of the way there.

That leaves just a few things that are different between the new and
old SDK.  First and foremost, the SDK library files themselves.  But
those are pretty easy, since the build environment just needs a direct
snapshot of the sources in the SDK's git repository, arranged in the
same directory structure.  We can replicate this by cloning the git
and checking out the desired version tag.

The second thing that's important to update in the new SDK is the
Arm GNU toolchain.  The VS Code configuration has a list of the
acceptable toolchain versions, so I picked the most recent (13.3.Rel1)
on the list.  This is also a fairly easy update, because Arm maintains
an official collection of GNU cross-compiler toolchain versions for its 
CPUs (the Pico RP2040 CPU is Arm-based), and does a nice job of
packaging them for the major platforms, including Windows.  And
once installed, the GNU tool set is all nicely self-contained, so
we can just make a snapshot of its install directory to include in our
updated build tree.

The only remaining loose end is "picotool", a custom tool that Raspberry
Pi provides.  That's really only needed because the CMake script
irritatingly insists on checking that it's present and up-to-date,
and bombs out early in the project build if it's not.  I say
"irritating" because the CMake script doesn't bother to check
whether or not the project it's building actually needs picotool;
it just assumes that it's a requirement, even when the project doesn't
care about it.  Fortunately, it's not too hard to build on Windows,
so building it seemed like the easiest way to resolve the script
complaint.  Besides, some projects might actually need it.

