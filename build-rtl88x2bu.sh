sudo sed /boot/config.txt -i -e "s/^dtoverlay=disable-wifi//"
sudo sed /boot/config.txt -i -e "s/^dtoverlay=disable-bt//"
echo "dtoverlay=disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=disable-bt" | sudo tee -a /boot/config.txt
sudo apt-get -y install bc raspberrypi-kernel-headers dkms

git clone https://github.com/cilynx/rtl88x2bu.git
cd rtl88x2bu

sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/g' Makefile

source ./dkms.conf
sudo cp -R . /usr/src/$PACKAGE_NAME-$PACKAGE_VERSION
sudo dkms add -m $PACKAGE_NAME -v $PACKAGE_VERSION
sudo dkms build -m $PACKAGE_NAME -v $PACKAGE_VERSION
sudo dkms install -m $PACKAGE_NAME -v $PACKAGE_VERSION

sudo modprobe 88x2bu
