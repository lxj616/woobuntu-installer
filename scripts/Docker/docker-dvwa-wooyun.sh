#!/bin/sh
sudo service docker restart
sudo docker pull index.tenxcloud.com/lxj616/docker-dvwa-wooyun
sudo service docker restart
cat > /tmp/docker-dvwa-wooyun.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=docker-dvwa-wooyun
Icon=application-default-icon
Exec=$term -e 'sh -c "sudo docker run --rm -p 80:80 index.tenxcloud.com/lxj616/docker-dvwa-wooyun"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF
sudo mv /tmp/docker-dvwa-wooyun.desktop /usr/share/applications
