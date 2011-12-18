#!/bin/bash

sbtVersion="0.11.2"

git clone git@github.com:max-l/env-setup.git home

curl -s -o `pwd`/home/bin/sbt-launch.jar "http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$sbtVersion/sbt-launch.jar"

echo "cmd.exe /c sh.exe home/interactive-shell.sh" > ./git-bash.cmd
