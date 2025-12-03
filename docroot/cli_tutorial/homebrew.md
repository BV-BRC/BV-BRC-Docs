# Installing the Command Line Interface with Homebrew

We support the installation of the BV-BRC CLI using [homebrew](https://brew.sh), a package manager for macOS and Linux. Homebrew allows you to install software on your system that the native package manager may not support. It's quite useful in patricular for MacOS since many of the common Linux packages and bioinformatics tools are not readily available for the Mac.

## Installing Homebrew

The installation of Homebrew is straightforward. The main caveat for installation on Linux is that without some extra work (that I have not yet tested myself) you need to have administrator (superuser) access to perform the initial installation. The MacOS build also requires administrator access but it is much more common for owners of laptops to have that access for their own systems.

## Installing Homebrew on macOS

The macOS installation instructions are available on the [Homebrew home page](https://brew.sh).

The macOS requirements for homebrew are as follows:

- An Apple Silicon CPU or 64-bit Intel CPU
- macOS Ventura (13) (or higher) installed on officially supported hardware
  - Note: Devices using OpenCore Legacy Patcher are not supported
- Command Line Tools (CLT) for Xcode (from xcode-select --install or https://developer.apple.com/download/all/) or Xcode 
- The Bourne-again shell for installation (i.e. bash)

The actual installation of Homebrew is a oneliner:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

To run that you would start a Terminal session and copy and paste the line into the shell prompt.

Alternatively, you may download a package installer from [Homebrew's latest GitHub release.](ttps://github.com/Homebrew/brew/releases/latest).

## Installing Homebrew on Linux

The Linux installation instructions are available on the [Homebrew docs site](https://docs.brew.sh/Homebrew-on-Linux).

The Linux requirements are as follows:

- Linux 3.2 or newer
- Glibc 2.13 or newer
- 64-bit x86_64 CPU

On suitable hardware, the [Windows Susbystem for Linux (WSL) 2](https://docs.microsoft.com/en-us/windows/wsl/about) is also supported. 

The [docs site](https://docs.brew.sh/Homebrew-on-Linux#requirements)  details the installation of the prerequisite tools. 

The actual installation of Homebrew is a oneliner:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Installing the BV-BRC CLI in Homebrew

Once Homebrew is installed, the installation of the CLI should be as simple as

```
brew tap BV-BRC/BV-BRC-CLI
```

```
brew install BV-BRC-CLI
```

If you have made the changes the initial Homebrew install recommends to add to your shell profile scripts, you should now have the BV-BRC CLI tools in your default path.

## Homebrew and Bottles

The BV-BRC Homebrew configuration has precompiled builds (bottles) for macOS Sequoia on both Apple Silicon and Intel, and x86_64 Linux. If you install onto a different system, Homebrew will need to do a full install from source. This can take a fair amount of time (it's 20 minutes on my Intel Mac). If you run into this, contact me at olson@mcs.anl.gov and we can arrange to build bottles for your platform.