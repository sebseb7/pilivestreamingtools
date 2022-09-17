sudo apt-get install zlib1g-dev libssl-dev wget

git clone -b master --single-branch --depth 1 https://github.com/arut/nginx-rtmp-module.git
cd nginx-rtmp-module
wget https://patch-diff.githubusercontent.com/raw/arut/nginx-rtmp-module/pull/1450.diff
cat 1450.diff | patch -p1
cd ..

wget -4 http://nginx.org/download/nginx-1.22.0.tar.gz
tar -xzf nginx-1.22.0.tar.gz
rm nginx-1.22.0.tar.gz
cd nginx-1.22.0
./configure --with-http_v2_module --with-http_ssl_module --without-http_fastcgi_module --without-http_rewrite_module --without-http_scgi_module --without-http_uwsgi_module --add-module=../nginx-rtmp-module
make -j4
sudo make install
cd ..
sudo cp nginx.conf /usr/local/nginx/conf
sudo cp nginx.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable nginx
sudo systemctl start nginx
