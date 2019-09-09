#!/usr/bin/env bash

set -xe

WORKDIR=/Volumes/Dev/personal/bootstrap-macos
DUMP_DATE=$(date "+%Y-%m-%d %H:%M:%S")

cd "${WORKDIR}" || (echo "${WORKDIR} does not exist" && exit 1)

brew bundle dump --force

git add "${WORKDIR}/Brewfile"

git commit -m "[Brewfile]: dump bundle - ${DUMP_DATE}"

git push origin master
