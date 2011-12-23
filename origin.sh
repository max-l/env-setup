#!/bin/bash

if [ ! -e "home" ]
then
  sbtVersion="0.11.2"
  git clone --quiet git@github.com:max-l/env-setup.git home
  rm -Rf home/.git
  curl -s -o `pwd`/home/bin/sbt-launch.jar "http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$sbtVersion/sbt-launch.jar"
  
  SANDBOX_DIR=`pwd`
  echo "export STRONGLINKS_SANDBOX_DIR=$SANDBOX_DIR" > home/bin/interactive-shell.sh
  cat home/bin/interactive-shell.template >> home/bin/interactive-shell.sh
fi

home/bin/interactive-shell.sh