#!/bin/sh
service docker restart
docker pull kalilinux/kali-linux-docker
service docker restart
