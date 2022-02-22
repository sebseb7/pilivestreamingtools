sudo sed /boot/config.txt -i -e "s/^dtoverlay=disable-wifi//"
sudo sed /boot/config.txt -i -e "s/^dtoverlay=disable-bt//"
echo "dtoverlay=disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=disable-bt" | sudo tee -a /boot/config.txt
sudo apt-get -y install raspberrypi-kernel-headers

git clone -b v5.6.4.2 --single-branch --depth 1 https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au

sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/g' Makefile

source ./dkms.conf
sudo cp -R . /usr/src/$PACKAGE_NAME-$PACKAGE_VERSION
sudo dkms add -m $PACKAGE_NAME -v $PACKAGE_VERSION
sudo dkms build -m $PACKAGE_NAME -v $PACKAGE_VERSION
sudo dkms install -m $PACKAGE_NAME -v $PACKAGE_VERSION

cd ..

sudo modprobe 88XXau
