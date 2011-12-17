#!/bin/bash

mkdir home

curl -o "home/.bashrc" https://raw.github.com/max-l/env-setup/master/home/.bashrc

echo "cmd.exe /c sh.exe --init-file ./home/.bashrc --login -i" > ./git-bash.cmd
