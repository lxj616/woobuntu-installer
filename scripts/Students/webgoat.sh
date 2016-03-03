#!/bin/sh
sudo rm -rf /opt/woobuntu/webgoat
sudo mkdir -p /opt/woobuntu/webgoat
sudo chmod a+rw webgoat
cd /opt/woobuntu/webgoat
sudo wget https://github.com/WebGoat/WebGoat/releases/download/7.0.1/webgoat-container-7.0.1-war-exec.jar -O webgoat.jar
cat > /tmp/webgoat.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=webgoat
Icon=application-default-icon
Exec=$term -e '/bin/bash -c "cd /opt/woobuntu/webgoat;java -jar webgoat.jar; exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

sudo mv /tmp/webgoat.desktop /usr/share/applications
