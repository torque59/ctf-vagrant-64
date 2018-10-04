# CTF Vagrant Box - 64 bit

This vagrant box is similar to https://github.com/ctfhacker/ctf-vagrant-64.
It has couple of usefull things i added, like changing the a minimal base image and tools to which i have added to make things better and easy

I have changed the image to minimal/xenial64 which reduces the size of the overall image and added couple of tools.

## Base Image

- minimal/xenial64

## Tools

- AFL Latest
- Radare (r2dec is pre-installed :D )
- Capstone
- binwalk
- z3-solver
- Gef
- Foremost
- Pwndbg (Uncomment if required)
- nmap

## Setup

- vagrant up
- vagrant ssh

## Modify

- To tweak to your own settings, modify the vagrant_setup.sh
