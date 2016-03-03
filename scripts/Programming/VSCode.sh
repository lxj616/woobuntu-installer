#!/bin/sh
sudo mkdir -p /opt/woobuntu
cd /opt/woobuntu
sudo wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=620884
sudo unzip VSCode-linux-x64-stable.zip
sudo rm VSCode-linux-x64-stable.zip
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
