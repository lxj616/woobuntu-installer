#!/bin/sh
cd /tmp
wget http://www.longene.org/download/WineQQ7.8-20151109-Longene.deb
dpkg -i WineQQ7.8-20151109-Longene.deb
apt-get -f install
