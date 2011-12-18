#!/bin/bash

PROJECT_DIRS=$STRONGLINKS_SANDBOX_DIR/git-projects


function cloneProject {

  cd $PROJECT_DIRS/$1
  sbt publish-local
}

cloneProject sl-core
cloneProject sl-tools
cloneProject scalaforms
cloneProject scalaforms-demo

