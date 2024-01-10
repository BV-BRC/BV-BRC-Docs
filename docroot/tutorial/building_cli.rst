:orphan:

==============================
 Building the Mac CLI Release
==============================

Clone the PATRIC distribution and tools::

  git clone https://github.com/PATRIC3/PATRIC-distribution
  git clone https://github.com/olsonanl/distro_utils

Bootstrap::

  cd distro_utils
  ./bootstrap /Applications/PATRIC.app/runtime
  . user-env.sh

Retrieve your API token from github and set in environment::

  export GITHUB_TOKEN=...

Set up distro::

  cd ../PATRIC-distribution
  create-manifest --no-recurse

Check out and build. This step must be done from a MacOS console session. A remote
desktop session is suitable::

  checkout-from-manifest ../build-1
  export KB_IGNORE_MISSING_DEPENDENCIES=1
  distro-build-mac-app --app-name PATRIC --icon ~/icon/patric.icns --banner "Welcome to the PATRIC Command Line Interface." ../build-1


==================================
 Building the Ubuntu CLI Release
==================================

Clone the PATRIC distribution and tools::

  git clone https://github.com/PATRIC3/PATRIC-distribution
  git clone https://github.com/olsonanl/distro_utils

Bootstrap::

  cd distro_utils
  ./bootstrap /usr
  . user-env.sh

Retrieve your API token from github and set in environment::

  export GITHUB_TOKEN=...

Set up distro::

  cd ../PATRIC-distribution
  create-manifest --no-recurse

Check out and build. This step must be done from a MacOS console session. A remote
desktop session is suitable::

  checkout-from-manifest ../build-1
  export KB_IGNORE_MISSING_DEPENDENCIES=1
  distro-build-ubuntu-app --ignore --app-name patric-cli --banner "Welcome to the PATRIC Command Line Interface." --description "The PATRIC Command Line Interface" ../build-1

===============================
 Configuring Unbuntu for Build
===============================

If not already there the universe repository is needed::

 sudo add-apt-repository universe
 sudo apt-get update

Install the following packages:

 * openssh-server
 * git
 * libconfig-simple-perl
 * libtemplate-perl
 * libwww-perl
 * libjson-xs-perl
 * libgetopt-long-descriptive-perl
 * libfile-slurp-perl
 * cpanminus
 * libgraph-perl
 * libparse-yapp-perl
 * libdevel-stacktrace-perl
 * libmoose-perl
 * liblingua-en-inflect-perl

This module doesn't have a package, so install with::

  sudo cpanm Sort::Topological
