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
plugins=(zsh-autosuggestions notify autojump vi-mode \
    zsh-syntax-highlighting autoswitch_virtualenv kubectl bd)

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

# spaceship prompt
export SPACESHIP_PROMPT_ORDER=( dir git kubectl docker pyenv venv ruby node package \
    line_sep time exec_time exit_code \
    line_sep vi_mode jobs char )
export SPACESHIP_COLOR_NORMAL="245"
export SPACESHIP_COLOR_HIDDEN="239"

export SPACESHIP_DIR_COLOR="$SPACESHIP_COLOR_NORMAL"
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_TIME_COLOR="$SPACESHIP_COLOR_HIDDEN"
export SPACESHIP_TIME_PREFIX=""
export SPACESHIP_GIT_COLOR="167" # orange-y red
export SPACESHIP_GIT_PREFIX=""
export SPACESHIP_GIT_BRANCH_PREFIX=" "
export SPACESHIP_GIT_BRANCH_COLOR="$SPACESHIP_GIT_COLOR"
export SPACESHIP_GIT_STATUS_COLOR="$SPACESHIP_GIT_COLOR"
export SPACESHIP_GIT_STATUS_PREFIX="%F{$SPACESHIP_GIT_COLOR}"
export SPACESHIP_GIT_STATUS_SUFFIX="%F{$SPACESHIP_GIT_COLOR}"
export SPACESHIP_GIT_STATUS_UNTRACKED="?"
export SPACESHIP_GIT_STATUS_ADDED="+"
export SPACESHIP_GIT_STATUS_MODIFIED="*"
export SPACESHIP_GIT_STATUS_RENAMED="→"
export SPACESHIP_GIT_STATUS_DELETED=""
export SPACESHIP_GIT_STATUS_STASHED="ﰤ "
export SPACESHIP_GIT_STATUS_UNMERGED=" "
export SPACESHIP_GIT_STATUS_AHEAD="裏"
export SPACESHIP_GIT_STATUS_BEHIND="裏"
export SPACESHIP_GIT_STATUS_DIVERGED="裏"
export SPACESHIP_DOCKER_PREFIX=""
export SPACESHIP_DOCKER_SYMBOL=" "
export SPACESHIP_DOCKER_VERBOSE=false
export SPACESHIP_DOCKER_COLOR="38" # cyan
export SPACESHIP_KUBECTL_SHOW=true
export SPACESHIP_KUBECTL_SYMBOL="ﴱ "
export SPACESHIP_KUBECTL_PREFIX=""
export SPACESHIP_KUBECTL_COLOR="38" # cyan
export SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW=true
export SPACESHIP_KUBECONTEXT_COLOR="38" # cyan
export SPACESHIP_KUBECTL_VERSION_SHOW=false
export SPACESHIP_PYENV_SYMBOL=" "
export SPACESHIP_PYENV_COLOR="26" # blue
export SPACESHIP_PYENV_PREFIX=""
export SPACESHIP_VENV_COLOR="$SPACESHIP_PYENV_COLOR"
export SPACESHIP_VENV_PREFIX="%F{$SPACESHIP_PYENV_COLOR}"
export SPACESHIP_VENV_SUFFIX="%F{$SPACESHIP_PYENV_COLOR}"
export SPACESHIP_RUBY_COLOR="124" # dark red
export SPACESHIP_RUBY_SYMBOL=" "
# TODO package and node
export SPACESHIP_NODE_SYMBOL=" "
export SPACESHIP_NODE_COLOR="29" # green
export SPACESHIP_NODE_PREFIX=""
export SPACESHIP_PACKAGE_SYMBOL=""
export SPACESHIP_PACKAGE_PREFIX="%F{$SPACESHIP_NODE_COLOR}"
export SPACESHIP_PACKAGE_SUFFIX="%F{$SPACESHIP_NODE_COLOR}"
export SPACESHIP_PACKAGE_COLOR="$SPACESHIP_NODE_COLOR"
export SPACESHIP_EXEC_TIME_COLOR="$SPACESHIP_COLOR_NORMAL"
export SPACESHIP_EXEC_TIME_PREFIX="%F{$SPACESHIP_EXEC_TIME_COLOR}祥"
export SPACESHIP_EXEC_TIME_ELAPSED=10
export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_VI_MODE_INSERT=""
export SPACESHIP_VI_MODE_NORMAL=""
export SPACESHIP_VI_MODE_COLOR="$SPACESHIP_COLOR_HIDDEN"
export SPACESHIP_CHAR_SYMBOL=" "
export SPACESHIP_CHAR_SYMBOL_SECONDARY=" "
export SPACESHIP_CHAR_COLOR_SUCCESS="$SPACESHIP_COLOR_NORMAL"
export SPACESHIP_CHAR_COLOR_SECONDARY="$SPACESHIP_COLOR_NORMAL"



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
if hash kubectl 2>/dev/null; then alias k="kubectl"; fi
if hash rbenv 2>/dev/null; then eval "$(rbenv init -)"; fi
if hash pyenv 2>/dev/null; then eval "$(pyenv init -)"; fi
if hash nodenv 2>/dev/null; then eval "$(nodenv init -)"; fi
if hash jenv 2>/dev/null; then eval "$(jenv init -)"; fi
if hash goenv 2>/dev/null; then eval "$(goenv init -)"; fi

# Update and cleanup brew regularly
if hash brew 2>/dev/null; then
    if ! ps aux|grep "brew.sh update"|grep -vq grep; then
        (brew update >> .brew_update 2>&1 &);
    fi
    if ! ps aux|grep "brew.rb cleanup"|grep -vq grep; then
        (brew cleanup -s >> .brew_cleanup 2>&1 &);
    fi
fi

# Prune docker dangling image regularly
if hash docker 2>/dev/null && ! ps aux|grep "docker image prune -f"|grep -vq grep; then
    (docker image prune -f >> .docker_prune 2>&1 &);
fi

if [ -d $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]; then
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    if ! ps aux|grep "gcloud components update"|grep -vq grep; then
        (gcloud components update >> .gcloud_update 2>&1 &);
    fi
fi

test -f ~/.zshrc_local && source ~/.zshrc_local
test -f ~/.zshrc_docker && source ~/.zshrc_docker
