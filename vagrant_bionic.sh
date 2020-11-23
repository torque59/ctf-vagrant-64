#!/bin/bash

# Basic requirements to get started

HOMEDIR=/home/vagrant
TOOLS=/home/vagrant/tools

cd $HOMEDIR && mkdir tools

# Updates
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get -y update

sudo apt-get -y install python3-pip
sudo apt-get -y install cmake
sudo apt-get -y install socat
sudo apt-get -y install tmux
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install unzip
sudo apt-get -y install foremost
sudo apt-get -y install pkg-config git neovim curl fish
sudo snap install --channel=15/stable --classic node


cd $TOOLS
# Install pwndbg
#git clone https://github.com/zachriggle/pwndbg
#echo source `pwd`/pwndbg/gdbinit.py >> ~/.gdbinit

pip3 install capstone

# pycparser for pwndbg
sudo pip3 install pycparser # Use pip3 for Python3

# Install z3-solver
pip3 install z3-solver

# PWN tools
pip3 install pwntools

# Install binwalk
git clone https://github.com/devttys0/binwalk && cd binwalk
sudo python setup.py install && cd $TOOLS

# Install pwndbg
git clone https://github.com/pwndbg/pwndbg
cd pwndbg && ./setup.sh && cd $TOOLS

# install basic nvim config
git clone https://github.com/trirpi/simple-nvim-config
mkdir -p ~/.config/nvim/ && cd simple-nvim-config
mkdir ~/.config/nvim/undodir
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Install oh-my-fish
#Copy the install_fish to the ctfs directory and run, some perms issue, too lazy to figure out

# Install pwntools
pip3 install pwntools

# Install ropper, unicorn and keystone for gef
pip3 install ropper
pip3 install --user --no-cache-dir keystone-engine
pip3 install unicorn

# frida-tools
pip3 install frida-tools

# Install nmap
sudo apt-get install -y nmap

