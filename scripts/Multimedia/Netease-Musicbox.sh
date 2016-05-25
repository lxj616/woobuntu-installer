#!/bin/sh
cd /tmp
wget http://s1.music.126.net/download/pc/netease-cloud-music_0.9.0-2_amd64.deb
sudo dpkg -i netease-cloud-music_0.9.0-2_amd64.deb
rm netease-cloud-music_0.9.0-2_amd64.deb
sudo apt-get -f install -y

