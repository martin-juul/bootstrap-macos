#!/usr/bin/env zsh

NPM_PACKAGES=(
  @angular/cli
  loadtest
)

npm i -g yarn

yarn global add "${NPM_PACKAGES[@]}"
