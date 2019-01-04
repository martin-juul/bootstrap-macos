#!/usr/bin/env zsh

echo "Installing RVM"

mkdir -p ~/.rvm/src && cd ~/.rvm/src && rm -rf ./rvm && \
git clone --depth 1 git://github.com/rvm/rvm.git && \
cd rvm && ./install

cat >~/.zshrc <<'EOL'
if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi
EOL