sudo apt-get install wiringpi
sudo raspi-config nonint do_memory_split 256
sudo sed /boot/config.txt -i -e "s/^dtoverlay=disable-wifi//"
sudo sed /boot/config.txt -i -e "s/^dtoverlay=disable-bt//"
echo "dtoverlay=disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=disable-bt" | sudo tee -a /boot/config.txt
sudo sed /boot/config.txt -i -e "s/^dtparam=audio=om/dtparam=audio=off/"
sudo systemctl disable hciuart
#raspi-config noint enable_overlayfs
