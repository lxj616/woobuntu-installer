#!/bin/sh
sudo service docker restart
sudo docker pull index.tenxcloud.com/lxj616/bwapp
sudo service docker restart
cat > /tmp/docker-bwapp.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=docker-bwapp
Icon=application-default-icon
Exec=$term -e 'sh -c "sudo docker run --rm -p 80:80 index.tenxcloud.com/lxj616/bwapp"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF
sudo mv /tmp/docker-bwapp.desktop /usr/share/applications
