#!/bin/bash
#
# Prerequisites :
#
#  1) Windows GIT : 
#    http://msysgit.googlecode.com/files/Git-1.7.8-preview20111206.exe
#
#    installation : 
#       http://help.github.com/win-set-up-git/
#    configuration for avoiding password prompt :
#       http://help.github.com/ssh-key-passphrases/
#
#  2) A 1.6 JDK :
#    http://www.oracle.com/technetwork/java/javase/downloads/jdk-6u30-download-1377139.html
#  
#  3) set JAVA_HOME in ~/.bashrc (*windows style mandatory*, ex: d:\x\y\jdk16)
#
#  - id_rsa and id_rsa.pub must exist in the .ssh directory.
#  - The following lines must exist in the .ssh/config file:
#    "Host github.com\n\tStrictHostKeyChecking no\n"


##########################################################################

eclipseFile="eclipse-SDK-3.7.1-win32-x86_64.zip"
scalaIDEFile="org.scala-ide.sdt.update-site-2.0.0-RC4.zip"
sbtVersion="0.11.2"

##########################################################################

set -e

if test "$1" = ""; then
 echo "No installation directory supplied."
 exit 1
fi

mkdir -p "$1"
cd "$1"
installDir="`pwd`"

echo "Installing to $installDir"

#This scripts resides in : 
git clone git@github.com:max-l/env-setup.git
#should we not get if first and then run it ?

git clone git@github.com:max-l/sl-core.git
git clone git@github.com:max-l/sl-tools.git
git clone git@github.com:max-l/scalaforms.git
git clone git@github.com:max-l/scalaforms-demo.git

while [ "$qInstallEclipse" != "y" ] && [ "$qInstallEclipse" != "n" ]; do
  read -p "install eclipse ? (y,n)" qInstallEclipse  
done

if [ "$qInstallEclipse" == "y" ]
then

	if [ -e "./$eclipseFile" ] 
	then
	  echo "$eclipseFile exists, will skip download."
	else 
	  echo "downloading eclipse"
      curl -s -o "$eclipseFile" "http://mirror.csclub.uwaterloo.ca/eclipse/eclipse/downloads/drops/R-3.7.1-201109091335/$eclipseFile"
	  #cp ../"$eclipseFile" .
	fi
	
	unzip -x "$eclipseFile"
	
	echo "downloading ScalaIDE"
	
	curl -s -o "$scalaIDEFile" -O http://cloud.github.com/downloads/max-l/env-setup/"$scalaIDEFile"
	#cp ../"$scalaIDEFile" .

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
fi

curl -s -o ~/bin/sbt-launch.jar "http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$sbtVersion/sbt-launch.jar"

function compile {
 cd $installDir/$1
 java -Xmx512M -jar ~/bin/sbt-launch.jar publish-local "eclipse skip-root"
}

compile "sl-core"
compile "sl-tools"
compile "scalaforms"
compile "scalaforms-demo"

