#!/usr/bin/env zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH=/usr/local/opt/bzip2/bin:/usr/local/opt/sqlite/bin:/usr/local/sbin:/usr/local/bin:$PATH

export ZSH="$HOME/.config/oh-my-zsh"

export ZSH_CACHE_DIR="$ZSH/cache"

export LDFLAGS="-L/usr/local/opt/bzip2/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openldap/lib -L/usr/local/opt/bison/lib -L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/bzip2/include -I/usr/local/opt/openssl/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openldap/include -I/usr/local/opt/libxml2/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig"

CASE_SENSITIVE="false"

export UPDATE_ZSH_DAYS=30

DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

ZSH_THEME="robbyrussell"

plugins=(
  aws
  git
  osx
)

source $ZSH/oh-my-zsh.sh

# User configuration

export ARCHFLAGS="-arch x86_64"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

##########
# Aliases
##########
alias art="php artisan"
alias devdir="cd /Volumes/Dev"
alias zshconfig="code ~/.zshrc"

alias nuke_node_modules="find . -name 'node_modules' -type d -prune -exec rm -r '{}' +"
alias nuke_vendor="find . -name 'vendor' -type d -prune -exec rm -r '{}' +"

##########
# Functions
##########

##########
# Tooling
##########

# pyenv
eval "$(pyenv init -)"

# fnm
eval "$(fnm env --multi)"

if [ -f ~/.env ]; then
  source ~/.env
fi

# go
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# phpbrew
export PHPBREW_ROOT="${HOME}/.phpbrew"
export PHPBREW_HOME="${PHPBREW_HOME}"
export PHPBREW_LOOKUP_PREFIX=homebrew
export PHPBREW_RC_ENABLE=1
source "${PHPBREW_ROOT}/bashrc"
