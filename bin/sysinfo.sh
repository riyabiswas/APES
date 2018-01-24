#!/bin/bash

#Get user information	
echo -e Username: `whoami`'\n' > sysinfo.txt

#Get Operating Sytem brand/type
echo -e Operating system: `uname`'\n'>> sysinfo.txt

#Get OS release information
echo -e OS distribution and version `lsb_release -d`'\n' >> sysinfo.txt

#Get Kernel version, version of compiler used and time stamp of last build
echo -e Kernel version, release, kernel gcc version build and build time:'\n'`cat /proc/version`'\n' >> sysinfo.txt

#Get hardware information	
echo -e System Architecture: `uname -p`'\n'>> sysinfo.txt

#Get information of memory utilization
echo -e File system memory information:'\n' `df -h`'\n'>> sysinfo.txt


