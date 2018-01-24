#!/bin/bash

cd /home/riya/apes/linux_4.15.0-rc9+

echo -e "\nDoing update \n"
sudo apt-get update &> /home/riya/apes/bin/kernel-build.log

echo -e "Installing dependencies \n"
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc &>> /home/riya/apes/bin/kernel-build.log

echo -e "compiling .config file with default settings \n"
make defconfig &>> /home/riya/apes/bin/kernel-build.log

echo -e "compiling kernel, installing module \n"
sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4 &>> /home/riya/apes/bin/kernel-build.log

echo -e "update-initramfs \n"
sudo update-initramfs -c -k $1 &>> /home/riya/apes/bin/kernel-build.log

echo -e "updating grub \n"
sudo update-grub &>> /home/riya/apes/bin/kernel-build.log
