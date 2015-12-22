#!/bin/sh
pip install pycrypto
pip2 install NetEase-MusicBox
apt-get install mpg123 -y
cat > /usr/share/applications/musicbox.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=musicbox
Icon=application-default-icon
Exec=xfce4-terminal -e '/bin/bash -c "musicbox; exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

