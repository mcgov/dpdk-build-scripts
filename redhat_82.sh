sudo yum update -y --disablerepo='*' --enablerepo='*microsoft*'
sudo yum -y install wget
wget https://github.com/DPDK/dpdk/archive/refs/tags/v20.11.tar.gz
tar xzvf v20.11.tar.gz
cd dpdk-20.11/
sudo
sudo yum -y groupinstall "Development Tools"
sudo yum -y groupinstall 'Infiniband Support'
sudo yum -y install gcc make git tar wget dos2unix psmisc kernel-devel-$(uname -r) numactl-devel.x86_64 librdmacm-devel libmnl-devel kernel-modules-extra numactl-devel kernel-headers elfutils-libelf-devel meson ninja-build libbpf-devel
pip3 install pyelftools
sudo dracut --add-drivers 'mlx5_ib ib_uverbs'
meson build
cd build
ninja
sudo ninja install
export PATH=$PATH:/usr/local/bin
