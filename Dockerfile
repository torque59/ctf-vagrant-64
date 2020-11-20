# Shoddy docker file borrowed from Liverflow
FROM ubuntu:18.04
ENV LC_CTYPE C.UTF-8
RUN dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y strace ltrace curl wget gcc net-tools vim gdb python python3 python3-pip wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip libc6:i386 libncurses5:i386 libstdc++6:i386 && \
pip install capstone requests pwn && \
pip3 install unicorn capstone ropper keystone-engine && \
mkdir tools && cd tools && \
git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && cd ../ && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && \
cd radare2 && sys/install.sh && \
wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2?revision=bc2c96c0-14b5-4bb4-9f18-bceb4050fee7?product=GNU%20Arm%20Embedded%20Toolchain,64-bit,,Linux,7-2018-q2-update
