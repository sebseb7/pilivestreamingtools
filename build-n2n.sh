sudo apt-get install autoconf libcap-dev libpcap-dev
git clone --single-branch --recursive --depth 1 -b 3.0-stable https://github.com/ntop/n2n.git
cd n2n
./autogen.sh
./configure
make
sudo make install

