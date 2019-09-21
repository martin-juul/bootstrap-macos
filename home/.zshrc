# =============================================================================
#                                Environment
# =============================================================================
source "${HOME}/.localrc"

export CLICOLOR=1
export BOOTSTRAP_DIR=/Volumes/Dev/personal/bootstrap-macos

# =============================================================================
#                                functions
# =============================================================================

# Sources file on first invocation
lazy_source () {
    eval "$1 () { [ -f $2 ] && source $2 && $1 \$@ }"
}

# Colorful messages
e_header()  { echo -e "\n\033[1m$@\033[0m"; }
e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }

ergo_add_proxy() {
  local host="${1}"

  e_header "Adding host ${host} to .ergo"
  echo "ergoproxy ${host}" >> .ergo
}

# =============================================================================
#                                   zgen
# =============================================================================
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  e_header "Creating a zgen save"
  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/rsync
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/shrink-path
	zgen oh-my-zsh plugins/ssh-agent

	zgen load zsh-users/zsh-autosuggestions
	zgen load zdharma/fast-syntax-highlighting
	zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-completions src

  zgen load supercrabtree/k
  zgen load junegunn/fzf
  zgen load StackExchange/blackbox

  # theme
  zgen load romkatv/powerlevel10k powerlevel10k

  # generate the init script from plugins above
  zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# =============================================================================
#                                zsh
# =============================================================================

# History
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

setopt share_history

setopt auto_cd

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

source "${HOME}/.aliases"

# =============================================================================
#                                tools
# =============================================================================

eval "$(pyenv init -)"
eval "$(pipenv --completion)"
eval "$(rbenv init -)"

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

