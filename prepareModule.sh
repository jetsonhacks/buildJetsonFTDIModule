#!/bin/sh
# Prepare to build some drivers for LT4 21.4 on the NVIDIA Jetson TK1
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   echo "$ sudo "$0""
   exit
fi


# Load prerequisites
apt-add-repository universe
apt-get update
apt-get install libncurses5-dev -y
# Get the kernel source for LT4 21.4
cd /usr/src/
wget http://developer.download.nvidia.com/embedded/L4T/r21_Release_v4.0/source/kernel_src.tbz2
# Decompress
tar -xvf kernel_src.tbz2
cd kernel
# Get the kernel configuration file
zcat /proc/config.gz > .config
# And begin editing
make menuconfig
make prepare
make modules_prepare
make M=drivers/usb/serial/
cp drivers/usb/serial/ftdi_sio.ko /lib/modules/$(uname -r)/kernel
depmod -a

