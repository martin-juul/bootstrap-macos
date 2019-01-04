export PATH=/usr/local/sbin:$HOME/.composer/vendor/bin:/usr/local/sbin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/usr/local/opt/libpq/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/martin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=13
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  composer
  copyfile
  dircycle
  dirhistory
  docker
  encode64
  extract
  git
  git-extras
  httpie
  jsontools
  ng
  osx
  redis-cli
  screen
  ssh-agent
  tmux
  vagrant
  vscode
  yarn
)

source $ZSH/oh-my-zsh.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/martin/dev/work/sitetech/project-goose/goose-app/terraform/aws/lambda/lambda@edge-image-compression/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/martin/dev/work/sitetech/project-goose/goose-app/terraform/aws/lambda/lambda@edge-image-compression/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/martin/dev/work/sitetech/project-goose/goose-app/terraform/aws/lambda/lambda@edge-image-compression/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/martin/dev/work/sitetech/project-goose/goose-app/terraform/aws/lambda/lambda@edge-image-compression/node_modules/tabtab/.completions/sls.zsh


for file in ~/.zsh_profile/_*; do
    source "$file"
done