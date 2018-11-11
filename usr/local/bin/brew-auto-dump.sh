#!/usr/bin/env bash

cd /Users/martin/dev/personal/bootstrap-macos

brew bundle dump --force

git commit -a -m "[Brewfile]: daily dump `date`"

git push origin master

