#!/bin/sh
pip install pycrypto
pip2 install NetEase-MusicBox
sudo apt-get install mpg123 -y
cat > /tmp/musicbox.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=musicbox
Icon=application-default-icon
Exec=$term -e '/bin/bash -c "musicbox; exec bash"'
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

sudo mv /tmp/musicbox.desktop /usr/share/applications
