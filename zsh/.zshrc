# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration

# HOMEBREW
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# BIN
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=~/bin:$PATH

# SBIN
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/local/sbin:$PATH

# FOR GO
export GOPATH="$HOME/code/go"
export GOBIN="$GOPATH/bin"
export PATH="/Applications/GoLand.app/Contents/MacOS:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="$HOME/.gotools:$PATH"
export GOPRIVATE=github.com/GetGo-Technologies/*

# FOR .NET
export PATH="/Users/raytoh/.dotnet/tools:$PATH"

# USEFUL PATHS
export godev="$GOPATH/src"
export dev="$HOME/code"
export pydev="$dev/python"
export jsdev="$dev/js"
export dotnetdev="$dev/dotnet"
export playdev="$dev/play"
export otherdev="$dev/others"
export doc="$HOME/Documents"
export tmp="/tmp"
export codesync="$dev/sync"

# FOR DOCKER
export DOCKER_HOST="unix://$HOME/.docker/run/docker.sock"

# GCP USAGE
# export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias g=git
alias gp="git pull"
alias gst="git stash"
alias gsa="git stash apply"
alias d=docker
alias k=kubectl
alias run=./run.sh
alias vim=nvim
alias view="nvim -R"
alias write=nvim
alias edit=nvim
alias tmux-rename-pane="tmux select-pane -T"

# ^[[1;10D backward 1 word
# ^[[1;10C forward 1 word

# ^[[1;2D backward 1 letter
# ^[[1;2C forward 1 letter

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --no-rehash -)"
fi

eval "$(direnv hook zsh)"

# GCP USAGE
# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/raytoh/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/raytoh/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/raytoh/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/raytoh/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source /Users/raytoh/.docker/init-zsh.sh || true # Added by Docker Desktop
