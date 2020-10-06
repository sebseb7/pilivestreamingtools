sudo apt-get install raspberrypi-kernel-headers

git clone -b v5.7.0 --single-branch --depth 1 https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au

sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/g' Makefile

make -j4

sudo make install

cd ..
