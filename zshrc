# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1
export DISABLE_UPDATE_PROMPT="true"

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
plugins=(zsh-autosuggestions bgnotify autojump vi-mode \
    zsh-syntax-highlighting k autoswitch_virtualenv)
. ~/.zsh_custom/plugins/zsh-bd/bd.zsh

# User configuration
ADD_PATH="/usr/local/bin"
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
    ADD_PATH="/usr/local/opt/coreutils/libexec/gnubin:${ADD_PATH}"
fi
if [ -d "${HOME}/.java-language-server" ]; then
    ADD_PATH="${HOME}/.java-language-server:${ADD_PATH}"
fi

export PATH=${ADD_PATH}:${PATH}
# export PATH=":$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
base16_tomorrow-night

export EDITOR="vim"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"

# vi-mode
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true

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
alias ls="ls -G"
alias lg="k -ah"

bindkey "" push-input

if hash gls 2>/dev/null; then
	alias ls="gls --color --group-directories-first"
fi
# start tmux
if hash tmux 2>/dev/null; then
    if [ -z "$TMUX" ]; then tmux a || tmux new; fi
fi
if hash nvim 2>/dev/null; then
    alias vim="nvim";
    alias v="nvim";
    export EDITOR="nvim"
fi
if hash git 2>/dev/null; then alias g="git"; fi
if hash rbenv 2>/dev/null; then eval "$(rbenv init -)"; fi
if hash pyenv 2>/dev/null; then eval "$(pyenv init -)"; fi
if hash nodenv 2>/dev/null; then eval "$(nodenv init -)"; fi
if hash jenv 2>/dev/null; then eval "$(jenv init -)"; fi

# Update brew regularly
if hash brew 2>/dev/null && ! ps aux|grep "brew.sh update"|grep -vq grep; then
    (brew update >> .brew_update 2>&1 &);
fi

# Prune docker danglingi image regularly
if hash docker 2>/dev/null && ! ps aux|grep "docker image prune -f"|grep -vq grep; then
    (docker image prune -f >> .docker_prune 2>&1 &);
fi

test -f ~/.zshrc_local && source ~/.zshrc_local
test -f ~/.zshrc_docker && source ~/.zshrc_docker
