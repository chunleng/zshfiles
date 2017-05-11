# Path to your oh-my-zsh installation.
export ZSH=$HOME/.base/install/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  dir
  git
  context
)
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_STATUS_FG=black
BULLETTRAIN_IS_SSH_CLIENT=true


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions bgnotify autojump git brew-cask brew pip vi-mode \
    zsh-syntax-highlighting k mvn rvm)
. ~/.zsh_custom/plugins/zsh-bd/bd.zsh

# User configuration
ADD_PATH="${HOME}/.base/install/homebrew/bin:/usr/local/bin:${HOME}/.base/install/node_modules/bin:${HOME}/.base/install/rundeck/server/sbin/:${HOME}/.base/install/rundeck/tools/bin"
if [ -d "${HOME}/.base/install/homebrew/Cellar/coreutils" ]; then
    ADD_PATH="${HOME}/.base/install/homebrew/Cellar/coreutils/`ls -1t ${HOME}/.base/install/homebrew/Cellar/coreutils | head -1`/libexec/gnubin:${ADD_PATH}"
fi

export PATH=${ADD_PATH}:${PATH}
# export PATH=":$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

export RDECK_BASE=${HOME}/.base/install/rundeck

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################
#  Non-oh-my-zsh Settings  #
############################


# Shell Colorscheme
export CLICOLOR=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

export BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_tomorrow

export EDITOR=nvim
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
export HOMEBREW_GITHUB_API_TOKEN="a4fece8099cb00dde83c4b175033efd66459b327"

##################
#  Key Bindings  #
##################

custom-next(){
    zle .history-search-forward
}
custom-prev(){
    zle .history-search-backward
}

zle -N custom-next
zle -N custom-prev

bindkey '^N' custom-next
bindkey '^P' custom-prev
bindkey '^ ' autosuggest-execute
bindkey '^[[Z' reverse-menu-complete

###########
#  Alias  #
###########
alias htop="sudo htop"
alias ls="ls --color --group-directories-first"
alias lg="k -ah"
alias vim="nvim -i NONE"

o(){
    nohup xdg-open $@ >/dev/null 2>&1
}

test -f ~/.zshrc_local && source ~/.zshrc_local


# start tmux
if [ -z "$TMUX" ]; then
    tmux a || tmux new
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
