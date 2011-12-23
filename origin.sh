#!/bin/bash

if [ ! -e "home" ]
then

  SANDBOX_DIR=`pwd`

  echo Will create a sandbox in "$SANDBOX_DIR"

  sbtVersion="0.11.2"
  git clone --quiet --depth 1 git@github.com:max-l/env-setup.git home
  rm -Rf home/.git
  curl -s -o $SANDBOX_DIR/home/bin/sbt-launch.jar "http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$sbtVersion/sbt-launch.jar"
  
  echo "export STRONGLINKS_SANDBOX_DIR=$SANDBOX_DIR" > home/bin/interactive-shell.sh
  cat home/bin/interactive-shell.template >> home/bin/interactive-shell.sh
  rm home/bin/interactive-shell.template
fi

home/bin/interactive-shell.sh