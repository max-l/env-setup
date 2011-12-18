#!/bin/bash

PROJECT_DIRS=$STRONGLINKS_SANDBOX_DIR/git-projects


function cloneProject {

  git clone git@github.com:max-l/$1.git $PROJECT_DIRS/$1
}

cloneProject sl-core
cloneProject sl-tools
cloneProject scalaforms
cloneProject scalaforms-demo

