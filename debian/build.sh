#!/bin/bash
#please, run this script as root
#This script builds a debian package, but lintian still reports some errors and warnings. Despite of that, it can be installed.
#copy files
cp ../server.py ../server.pem package/usr/share/NVDARemoteServer
#change permissions
chown -R root package
chgrp -R root package
chmod -R 755 package
chmod -x package/usr/share/NVDARemoteServer/server.py
chmod -x package/usr/share/NVDARemoteServer/server.pem
#build the package
dpkg-deb --build package
mv package.deb nvda-remote-server.deb
