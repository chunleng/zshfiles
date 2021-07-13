source $(brew --prefix)/Cellar/zinit/*/zinit.zsh

# https://github.com/zdharma/zinit/blob/master/_zinit
zinit ice depth"1" atinit"zpcompinit" as"completion" wait lucid
zinit snippet https://github.com/zdharma/zinit/blob/master/_zinit

zinit ice depth"1"
zinit light spaceship-prompt/spaceship-prompt
    export SPACESHIP_PROMPT_ORDER=( dir git aws gcloud kubectl docker pyenv venv ruby node package \
        line_sep time exec_time exit_code \
        line_sep jobs char )
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
    export SPACESHIP_AWS_PREFIX=""
    export SPACESHIP_AWS_SYMBOL=" "
    export SPACESHIP_GCLOUD_SHOW=false # hide by default
    export SPACESHIP_GCLOUD_PREFIX=""
    export SPACESHIP_GCLOUD_SYMBOL=" "
    export SPACESHIP_PYENV_SYMBOL=" "
    export SPACESHIP_PYENV_COLOR="26" # blue
    export SPACESHIP_PYENV_PREFIX=""
    export SPACESHIP_VENV_COLOR="$SPACESHIP_PYENV_COLOR"
    export SPACESHIP_VENV_PREFIX="%F{$SPACESHIP_PYENV_COLOR}"
    export SPACESHIP_VENV_SUFFIX="%F{$SPACESHIP_PYENV_COLOR}"
    export SPACESHIP_RUBY_COLOR="124" # dark red
    export SPACESHIP_RUBY_SYMBOL=" "
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
    export SPACESHIP_CHAR_SYMBOL="→ "
    export SPACESHIP_CHAR_SYMBOL_SECONDARY=" "
    export SPACESHIP_CHAR_COLOR_SUCCESS="$SPACESHIP_COLOR_NORMAL"
    export SPACESHIP_CHAR_COLOR_SECONDARY="$SPACESHIP_COLOR_NORMAL"

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
zinit snippet OMZP::vi-mode
    export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=false
    export VI_MODE_SET_CURSOR=true

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/autojump
zinit snippet OMZP::autojump

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rbenv
zinit ice wait lucid
zinit snippet OMZP::rbenv

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jenv
zinit ice wait lucid
zinit snippet OMZP::jenv

# https://github.com/zsh-users/zsh-autosuggestions
zinit ice depth"1"
zinit light zsh-users/zsh-autosuggestions
    bindkey '^ ' autosuggest-execute
    bindkey -a '^ ' autosuggest-execute

# https://github.com/marzocchi/zsh-notify
# To trick zsh-notify into thinking that it is a valid program
export TERM_PROGRAM='Apple_Terminal'
zinit ice depth"1"
zinit light marzocchi/zsh-notify
    zstyle ':notify:*' command-complete-timeout 10
    zstyle ':notify:*' error-sound "Sosumi"
    zstyle ':notify:*' success-sound "Blow"

# https://github.com/Tarrasch/zsh-bd
zinit ice depth"1"
zinit light Tarrasch/zsh-bd

# https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv
zinit ice depth"1"
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# https://github.com/zdharma/fast-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting

# https://github.com/Aloxaf/fzf-tab
zinit ice depth"1" atinit"zpcompinit" wait lucid
zinit light Aloxaf/fzf-tab
    zstyle ':fzf-tab:complete:ls*:*' fzf-preview 'bat -n --color=auto $realpath'
    zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat -n --color=auto $realpath'
    zstyle ':fzf-tab:*' fzf-bindings 'ctrl-space:toggle+down' 'bspace:backward-delete-char/eof' 'space:accept'

# https://github.com/C-uo/zsh-nodenv
zinit ice depth"1" wait lucid
zinit light C-uo/zsh-nodenv

# https://github.com/ptavares/zsh-direnv
zinit ice wait lucid
zinit load ptavares/zsh-direnv

# https://github.com/rhysd/zsh-bundle-exec
zinit load rhysd/zsh-bundle-exec
    export BUNDLE_EXEC_GEMFILE_CURRENT_DIR_ONLY=yes
    export BUNDLE_EXEC_RUBY_COMMAND=${HOME}



# ZSH completion
# ===============

# https://github.com/gradle/gradle-completion
zinit ice depth"1" as"completion" wait lucid
zinit light gradle/gradle-completion

# https://docs.docker.com/compose/completion
zinit ice depth"1" atinit"zpcompinit" as"completion" wait lucid
zinit snippet https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose

# https://github.com/chunleng/_kubectl
zinit ice atinit"zpcompinit" as"completion" wait lucid
zinit light chunleng/_kubectl

# https://github.com/zsh-users/zsh-completions/blob/master/src/_rails 
zinit ice atinit"zpcompinit" as"completion" wait lucid
zinit snippet https://github.com/zsh-users/zsh-completions/blob/master/src/_rails



# Key Bindings
# =============

# Bug? for some normal binding is needed first before `-a` works
bindkey '^N' .history-search-forward
bindkey -a '^N' .history-search-forward
bindkey '^P' .history-search-backward
bindkey -a '^P' .history-search-backward
bindkey '^T' .push-input
bindkey -a '^T' .push-input
bindkey '^U' .backward-kill-line
bindkey -a '^U' .backward-kill-line

# Local Settings
# ===============

ADD_PATH="/usr/local/bin"
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
    ADD_PATH="/usr/local/opt/coreutils/libexec/gnubin:${ADD_PATH}"
fi

export PATH=${ADD_PATH}:${PATH}

# Shell Colorscheme
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="nvim"

export FZF_DEFAULT_COMMAND='fd --type f'

# Ctrl-w deletes alphanumeric and the following characters
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
alias ls="ls --color --group-directories-first"
alias vim="nvim";
alias v="nvim";
alias g="git"
alias k="kubectl"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(goenv init -)"

# source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Android Development
if [ -d $HOME/Library/Android/sdk ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

test -f ~/.zshrc_local && source ~/.zshrc_local
