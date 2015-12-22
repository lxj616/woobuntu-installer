#!/bin/sh
mkdir -p /opt/woobuntu
cd /opt/woobuntu
wget https://az764295.vo.msecnd.net/public/0.10.3/VSCode-linux64.zip
unzip VSCode-linux64.zip
rm VSCode-linux64.zip
cd /root
cat > /usr/share/applications/vscode.desktop <<EOF
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

