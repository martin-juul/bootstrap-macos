#!/usr/bin/env

cd $HOME

curl -sSO https://raw.githubusercontent.com/GitAlias/gitalias/master/gitalias.txt

mkdir -pv $HOME/.gitconfig.d

echo >> EOF

[include]
   path = ~/.gitconfig.d/gitalias.txt

    [alias]
    l = log --graph --oneline
EOF | tee $HOME/.gitconfig