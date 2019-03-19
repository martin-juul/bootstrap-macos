#!/usr/bin/env bash

COMPOSER_PACKAGES=(
  hirak/prestissimo
  laravel/installer
  laravel/lumen-installer
)

composer require ${COMPOSER_PACKAGES[@]}
