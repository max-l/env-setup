#!/bin/bash

mkdir home

curl -s -O home/.bashrc https://raw.github.com/max-l/env-setup/master/home/.bashrc

echo "cmd.exe /c sh.exe --init-file ./home/.bashrc --login -i" >> ./git-bash.cmd
