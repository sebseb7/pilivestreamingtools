curl https://get.speedify.com/pgp.key | sudo apt-key add
sudo sh -c 'echo deb http://apt.connectify.me/ speedify main > /etc/apt/sources.list.d/connectify.list'
sudo apt-get update
sudo apt-get install speedify
/usr/share/speedify/speedify_cli startupconnect on
/usr/share/speedify/speedify_cli encryption off
/usr/share/speedify/speedify_cli mode streaming
/usr/share/speedify/speedify_cli login <login> <password>
/usr/share/speedify/speedify_cli connect closest
sudo cp speedify.conf /etc/speedify
sudo service speedify-sharing restart

