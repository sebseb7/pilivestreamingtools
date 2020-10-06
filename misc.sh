sudo apt-get install wiringpi
sudo raspi-config nonint do_memory_split 256
echo "dtoverlay=pi3-disable-wifi" | sudo tee -a /boot/config.txt
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
#raspi-config noint enable_overlayfs
