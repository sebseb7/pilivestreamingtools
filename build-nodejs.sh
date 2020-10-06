wget https://nodejs.org/dist/v12.18.4/node-v12.18.4.tar.gz
tar -xzf node-v12.18.4.tar.gz
rm node-v12.18.4.tar.gz
cd node-v12.18.4
./configure
make -j2
sudo make install
cd ..
sudo npm i -g pm2
sudo pm2 startup

