#!/bin/bash

echo -e "\nDoing update \n"
sudo apt-get update

echo -e "Installing dependencies \n"
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc

echo -e "compiling .config file with default settings \n"
make defconfig

echo -e "compiling kernel, installing module \n"
sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4

echo -e "update-initramfs \n"
sudo update-initramfs -c -k $1

#echo -e "updating grub \n"
#sudo update-grub

#comment grub timeouts
#sudo grub-mkconfig -o /boot/grub/grub.cfg


