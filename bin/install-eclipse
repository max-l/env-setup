#!/bin/bash

##########################################################################

eclipseFile="eclipse-SDK-3.7.1-win32-x86_64.zip"
scalaIDEFile="org.scala-ide.sdt.update-site-2.0.0-RC4.zip"

##########################################################################

echo "will install eclipse, be patient !"

set -e

ECLIPSE_INSTALL_DIR=$STRONGLINKS_SANDBOX_DIR

curl -o "$eclipseFile" "http://mirror.csclub.uwaterloo.ca/eclipse/eclipse/downloads/drops/R-3.7.1-201109091335/$eclipseFile"

unzip -x "$eclipseFile"
	
echo "downloading ScalaIDE"
	
curl -o "$scalaIDEFile" -O http://cloud.github.com/downloads/max-l/env-setup/"$scalaIDEFile"

unzip -x -d "scala-ide" "$scalaIDEFile"

cp scala-ide/features/* eclipse/features
cp scala-ide/plugins/* eclipse/plugins

eclipse_ini="eclipse/eclipse.ini"

cp "$eclipse_ini" "$eclipse_ini".bak

echo "-startup"	> "$eclipse_ini"
echo "plugins/org.eclipse.equinox.launcher_1.2.0.v20110502.jar" >> "$eclipse_ini"
echo "--launcher.library">> "$eclipse_ini"
echo "plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.1.100.v20110502" >> "$eclipse_ini"
echo "-showsplash" >> "$eclipse_ini"
echo "org.eclipse.platform"  >> "$eclipse_ini"
echo "--launcher.XXMaxPermSize" >> "$eclipse_ini"
echo "256m" >> "$eclipse_ini"
echo "--launcher.defaultAction" >> "$eclipse_ini"
echo "openFile" >> "$eclipse_ini"
echo "-vm" >> "$eclipse_ini"
echo "$JAVA_HOME/bin/javaw.exe" >> "$eclipse_ini"
echo "-vmargs" >> "$eclipse_ini"
echo "-Xms256m" >> "$eclipse_ini"
echo "-Xmx1024m" >> "$eclipse_ini"

echo "installation of $scalaIDEFile into $eclipseFile successful."
