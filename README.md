This repository contains scripts used to compile the FTDI module for the NVIDIA Jetson TK1.

The current version is for L4T 21.4

The script prepareModule.sh builds the FTDI module by downloading the kernel sources, unpacking them, and modifying the .config file to indicate that the FTDI module should be compiled, along with setting the local version release of the kernel. The module is then compiled copied to the appropriate system /lib/module directory. Please modify and use this script for your own purposes.

The script removeSources.sh removes the kernel sources that the prepareModule script downloaded. This is useful in the case where only the FTDI module needs to be built, and the sources are no longer needed. For most applications this is not necessary, but is useful when space is at a premium.
