#!/bin/sh
service docker restart
docker pull index.tenxcloud.com/lxj616/dockermutillidae
service docker restart
cat > /usr/share/applications/docker-mutillidae.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=docker-mutillidae
Icon=application-default-icon
Exec=xfce4-terminal -e 'sh -c "sudo docker run --rm -p 80:80 index.tenxcloud.com/lxj616/dockermutillidae"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF
