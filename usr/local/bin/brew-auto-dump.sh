#!/usr/bin/env bash

WORKDIR=/Volumes/Dev/personal/bootstrap-macos

cd "${WORKDIR}"

brew bundle dump --force

git add "${WORKDIR}/Brewfile"

git commit -m "[Brewfile]: dump `date`"

git push origin master