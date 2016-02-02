#!/bin/sh
cd /tmp
wget http://cdn2.ime.sogou.com/dl/index/1446541585/sogoupinyin_2.0.0.0068_amd64.deb
sudo dpkg -i sogoupinyin_2.0.0.0068_amd64.deb
rm sogoupinyin_2.0.0.0068_amd64.deb
sudo apt-get -f install -y

