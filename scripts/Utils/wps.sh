#!/bin/sh
cd /tmp
wget http://kdl.cc.ksosoft.com/wps-community/download/a20/wps-office_10.1.0.5444~a20_amd64.deb
dpkg -i wps-office_10.1.0.5444~a20_amd64.deb
rm wps-office_10.1.0.5444~a20_amd64.deb
