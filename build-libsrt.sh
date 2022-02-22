sudo apt-get install tclsh pkg-config cmake libssl-dev build-essential
if [ -d "srt" ]; then
  cd srt
  git pull
else
  git clone -b master --single-branch --depth 1 https://github.com/Haivision/srt.git
  cd srt
fi
./configure
make -j4
sudo make install
cd ..
