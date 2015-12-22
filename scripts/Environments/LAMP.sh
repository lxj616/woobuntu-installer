#!/bin/sh
apt-get install apache2 php5 mysql-server php5-mysql -y
cat > /usr/share/applications/apache2-start.desktop <<EOF
[Desktop Entry]
Type=Application
Name=apache2-start
Exec=xfce4-terminal -e 'sh -c "gksudo service apache2 start; exec bash"'
Icon=application-default-icon
EOF

cat > /usr/share/applications/apache2-stop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=apache2-stop
Exec=xfce4-terminal -e 'sh -c "gksudo service apache2 stop; exec bash"'
Icon=application-default-icon
EOF

cat > /usr/share/applications/mysql-start.desktop <<EOF
[Desktop Entry]
Type=Application
Name=mysql-start
Exec=xfce4-terminal -e 'sh -c "gksudo service mysql start; exec bash"'
Icon=application-default-icon
EOF

cat > /usr/share/applications/mysql-stop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=mysql-stop
Exec=xfce4-terminal -e 'sh -c "gksudo service mysql stop; exec bash"'
Icon=application-default-icon
EOF

