#!/bin/sh
mkdir -p /opt/woobuntu
cd /opt/woobuntu
git clone https://github.com/lxj616/altman-prebuilt-x86_64.git
mv altman-prebuilt-x86_64 altman
apt-get install mono-complete libgdiplus gtk-sharp2 -y
cat > /usr/share/applications/altman.desktop <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=altman
Icon=application-default-icon
Exec=mono /opt/woobuntu/altman/Altman.Gtk.exe
NoDisplay=false
Categories=woobuntu;
StartupNotify=true
Terminal=false
EOF

