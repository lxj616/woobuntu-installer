#!/bin/sh
cd /tmp
git clone https://github.com/LiuLang/bcloud-packages.git
cd bcloud-packages
dpkg -i *.deb
apt-get -f install -y
