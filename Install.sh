#!/usr/bin/env bash

echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Reloading shell"
source ~/.bashrc

make_dirs() {
    cd ~

    mkdir -pv dev/personal
    mkdir -pv dev/work
}

install_scripts() {
    cp -R ./usr/local/bin /usr/local/bin
}

echo "Installing Crontab"
cp ./var/at/tabs/martin /var/at/tabs/martin