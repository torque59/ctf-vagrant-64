#!/bin/bash

HOMEDIR=/home/vagrant
# Updates
sudo apt-get -y update

sudo apt-get -y install python3-pip
sudo apt-get -y install cmake
sudo apt-get -y install socat
sudo apt-get -y install tmux
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install unzip
sudo apt-get -y install foremost
apt-get install -y pkg-config

# QEMU with MIPS/ARM - http://reverseengineering.stackexchange.com/questions/8829/cross-debugging-for-mips-elf-with-qemu-toolchain
sudo apt-get -y install qemu qemu-user qemu-user-static
sudo apt-get -y install 'binfmt*'
sudo apt-get -y install libc6-armhf-armel-cross
sudo apt-get -y install debian-keyring
sudo apt-get -y install debian-archive-keyring
sudo apt-get -y install emdebian-archive-keyring
tee /etc/apt/sources.list.d/emdebian.list << EOF
deb http://mirrors.mit.edu/debian squeeze main
deb http://www.emdebian.org/debian squeeze main
EOF
sudo apt-get -y install libc6-mipsel-cross
sudo apt-get -y install libc6-arm-cross
mkdir /etc/qemu-binfmt
ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel
ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm
rm /etc/apt/sources.list.d/emdebian.list
# sudo apt-get update

# Install Pwntools
sudo apt-get -y install python2.7 python-pip python-dev git
pip install pwntools

cd $HOMEDIR
mkdir tools
cd tools

# Install pwndbg
#git clone https://github.com/zachriggle/pwndbg
#echo source `pwd`/pwndbg/gdbinit.py >> ~/.gdbinit

# Capstone for pwndbg
git clone https://github.com/aquynh/capstone
cd capstone
git checkout -t origin/next
sudo ./make.sh install
cd bindings/python
sudo python3 setup.py install # Ubuntu 14.04+, GDB uses Python3

# pycparser for pwndbg
sudo pip3 install pycparser # Use pip3 for Python3

# Install radare2
git clone https://github.com/radare/radare2
cd radare2
./sys/install.sh

# Install r2pipe
pip install r2-pipe

# Install z3-solver
pip install z3-solver

# Install binwalk
cd
git clone https://github.com/devttys0/binwalk
cd binwalk
sudo python setup.py install

# Install Firmware-Mod-Kit
sudo apt-get -y install git build-essential zlib1g-dev liblzma-dev python-magic
cd ~/tools
wget https://firmware-mod-kit.googlecode.com/files/fmk_099.tar.gz
tar xvf fmk_099.tar.gz
rm fmk_099.tar.gz
cd fmk_099/src
./configure
make

# Uninstall capstone
sudo pip2 uninstall capstone -y

# Install correct capstone
cd ~/tools/capstone/bindings/python
sudo python setup.py install

# Install pwntools
pip install pwntools

# Install Angr
cd /home/vagrant
sudo apt-get -y install python-dev libffi-dev build-essential virtualenvwrapper
sudo pip install virtualenv
virtualenv angr
source angr/bin/activate
pip install angr --upgrade

# Install AFL latest
cd ~/tools/
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -xvf afl-latest.tgz
afl_temp=$(tar -tvf afl-latest.tgz | head -n1 | cut -d':' -f2 | cut -d' ' -f2)
cd $afl_temp
make && sudo make install

sudo ldconfig

# Use GEF
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Install ropper, unicorn and keystone for gef
pip3 install ropper
pip3 install --user --no-cache-dir keystone-engine
pip3 install unicorn

# Installing r2dec
r2pm init
r2pm update
r2pm install r2dec

# Install nmap
sudo apt-get install -y nmap

