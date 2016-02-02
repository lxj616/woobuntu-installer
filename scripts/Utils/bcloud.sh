#!/bin/sh
cd /tmp
git clone https://github.com/LiuLang/bcloud-packages.git
cd bcloud-packages
sudo dpkg -i *.deb
sudo apt-get -f install -y
