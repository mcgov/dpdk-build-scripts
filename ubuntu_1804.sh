#!/bin/bash

sudo apt-add-repository -y ppa:canonical-server/server-backports
sudo apt install build-essential libmnl-dev libelf-dev meson rdma-core librdmacm1 libnuma-dev dpkg-dev pkg-config python3-pip python3-pyelftools python-pyelftools
pip3 install --upgrade meson
mv /usr/bin/meson /usr/bin/meson.bak
ln -s /usr/local/bin/meson /usr/bin/meson
pip3 install --upgrade ninja
git clone https://github.com/DPDK/dpdk.git
cd dpdk
meson build
cd build
ninja
ninja install
export PATH=$PATH:/usr/local/bin
