#!/usr/bin/env zsh

COMPOSER_PACKAGES=(
  hirak/prestissimo
  laravel/installer
  laravel/lumen-installer
)

composer require "${COMPOSER_PACKAGES[@]}"
