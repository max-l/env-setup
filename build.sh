#!/bin/bash

reldir=`dirname $0`
cd $reldir
root=`pwd`

set -o verbose

function process {
  echo "Directory >>>> $1" 
  cd $root/$1
  rm -R `find . -name '*.class' -type f`
  rm -R `find . -name 'target' -type d`
  rm -R `find . -name '.target' -type d`
  rm -R `find . -name 'bin' -type d`
  rm -R `find . -name '.project' -type f`
  rm -R `find . -name '.classpath' -type f`
  java -Xmx512M -jar ~/bin/sbt-launch-0.11.2.jar "set logLevel in Global := Level.Warn" clean publish-local "eclipse skip-root"
}  

echo Build in progress...

process "sl-core"         
process "sl-tools"        
process "scalaforms"      
process "scalaforms-demo" 

