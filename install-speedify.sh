read -p "AP Name:"

sed speedify.conf -i -e "s/^WIFI_SSID.*$//"
echo "WIFI_SSID=\"$REPLY\"" >> speedify.conf

read -p "AP Password (8 characters):"

sed speedify.conf -i -e "s/^WIFI_PASSWORD.*$//"
echo "WIFI_PASSWORD=\"$REPLY\"" >> speedify.conf

read -p "Speedify login:"
sp_login=$REPLY
read -s -p "Speedify password (not displayed):"
sp_pass=$REPLY

curl https://get.speedify.com/pgp.key | sudo apt-key add
sudo sh -c 'echo deb http://apt.connectify.me/ speedify main > /etc/apt/sources.list.d/connectify.list'
sudo apt-get update
sudo apt-get -y install speedify
/usr/share/speedify/speedify_cli startupconnect on
/usr/share/speedify/speedify_cli encryption off
/usr/share/speedify/speedify_cli mode streaming
/usr/share/speedify/speedify_cli login $sp_login $sp_pass
/usr/share/speedify/speedify_cli connect closest
sudo cp speedify.conf /etc/speedify
sudo service speedify-sharing restart
sudo cp /usr/share/speedify/speedify_cli /usr/bin/speedify 
