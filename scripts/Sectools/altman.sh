#!/bin/sh
sudo mkdir -p /opt/woobuntu
cd /opt/woobuntu
sudo git clone https://github.com/lxj616/altman-prebuilt-x86_64.git
sudo mv altman-prebuilt-x86_64 altman
sudo apt-get install mono-complete libgdiplus gtk-sharp2 -y
cat > /tmp/altman.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=altman
Icon=application-default-icon
Exec=mono /opt/woobuntu/altman/Altman.Gtk.exe
NoDisplay=false
Categories=woobuntu_web;
StartupNotify=true
Terminal=false
EOF

sudo mv /tmp/altman.desktop /usr/share/applications
