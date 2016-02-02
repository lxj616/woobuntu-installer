#!/bin/sh
sudo service docker restart
sudo docker pull kalilinux/kali-linux-docker
sudo service docker restart
