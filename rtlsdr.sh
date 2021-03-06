#!/bin/bash
sudo apt-get update
sudo apt-get install -y git cmake build-essential
sudo apt-get install -y libusb-1.0-0-dev
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
echo "blacklist dvb_usb_rtl28xxu" > blacklist-rtl.conf
sudo mv blacklist-rtl.conf /etc/modprobe.d
echo "Done, restart computer and run rtl_test -t to test"
