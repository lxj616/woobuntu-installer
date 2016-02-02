#!/bin/sh
sudo mkdir -p /opt/woobuntu
cd /opt/woobuntu
sudo wget https://az764295.vo.msecnd.net/public/0.10.3/VSCode-linux64.zip
sudo unzip VSCode-linux64.zip
sudo rm VSCode-linux64.zip
cat > /tmp/vscode.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=VSCode
Icon=application-default-icon
Exec=/opt/woobuntu/VSCode-linux-x64/Code
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

sudo mv /tmp/vscode.desktop /usr/share/applications
