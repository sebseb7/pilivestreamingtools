./build-libsrt.sh

git clone -b master --single-branch --depth 1 https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg
wget https://github.com/lgeek/FFmpeg/commit/10a7ccaceb56cd4ed1275a155900fb6087fe9f56.diff
cat 10a7ccaceb56cd4ed1275a155900fb6087fe9f56.diff | patch -p1
wget https://github.com/lgeek/FFmpeg/commit/4fcb83f2aa2b1d2e6ad528687cf159c167b98b18.diff
cat 4fcb83f2aa2b1d2e6ad528687cf159c167b98b18.diff | patch -p1
./configure --enable-gpl --enable-omx --enable-omx-rpi --enable-nonfree --enable-mmal --enable-libsrt --extra-ldflags=-latomic --arch=armel --target-os=linux
make -j4
sudo make install
cd ..
