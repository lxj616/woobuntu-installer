#!/bin/sh
sudo apt-get install apache2 php5 mysql-server php5-mysql -y
cat > /tmp/apache2-start.desktop <<EOF
[Desktop Entry]
Type=Application
Name=apache2-start
Exec=$term -e 'sh -c "gksudo service apache2 start; exec bash"'
Icon=application-default-icon
EOF
sudo mv /tmp/apache2-start.desktop /usr/share/applications

cat > /tmp/apache2-stop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=apache2-stop
Exec=$term -e 'sh -c "gksudo service apache2 stop; exec bash"'
Icon=application-default-icon
EOF
sudo mv /tmp/apache2-stop.desktop /usr/share/applications

cat > /tmp/mysql-start.desktop <<EOF
[Desktop Entry]
Type=Application
Name=mysql-start
Exec=$term -e 'sh -c "gksudo service mysql start; exec bash"'
Icon=application-default-icon
EOF
sudo mv /tmp/mysql-start.desktop /usr/share/applications

cat > /tmp/mysql-stop.desktop <<EOF
[Desktop Entry]
Type=Application
Name=mysql-stop
Exec=$term -e 'sh -c "gksudo service mysql stop; exec bash"'
Icon=application-default-icon
EOF
sudo mv /tmp/mysql-stop.desktop /usr/share/applications

