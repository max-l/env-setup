#!/bin/bash

if [ ! -e "home/interactive-shell.sh" ]
then
  sbtVersion="0.11.2"
  git clone git@github.com:max-l/env-setup.git home
  rm -Rf env-setup/.git
  curl -s -o `pwd`/home/bin/sbt-launch.jar "http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$sbtVersion/sbt-launch.jar"
fi

home/interactive-shell.sh