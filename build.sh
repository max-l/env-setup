#!/bin/bash

reldir=`dirname $0`
cd $reldir
root=`pwd`

function zap {
  local list=`find . -name $1`
  for file in $list; do 
    rm -R $file 
  done
}

function process {
  echo "Directory >>>> $1" 
  cd $root/$1
  zap '*.class -type f'
  zap 'target -type d'
  zap '.target -type d'
  zap 'bin -type d'
  zap '.project -type f'
  zap '.classpath -type f'
  java -Xmx512M -jar ~/bin/sbt-launch-0.11.2.jar "set logLevel in Global := Level.Warn" clean publish-local "eclipse skip-root"
}  

echo Build in progress...

process "sl-core"         
process "sl-tools"        
process "scalaforms"      
process "scalaforms-demo" 

