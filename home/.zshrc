#!/usr/bin/env zsh

source ${HOME}/.zsh_env

FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fpath=(/usr/local/share/zsh-completions $fpath)

export ZSH="${HOME}/.config/oh-my-zsh"

export ZSH_CACHE_DIR="${ZSH}/cache"

export UPDATE_ZSH_DAYS=30

CASE_SENSITIVE="false"
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

source ${ZSH}/oh-my-zsh.sh

source ${HOME}/.zsh_aliases

##########
# Tooling
##########

# pyenv
eval "$(pyenv init -)"

# fnm
eval "$(fnm env --multi)"

source "${PHPBREW_ROOT}/bashrc"
