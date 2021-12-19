if [ $(uname -m) = 'arm64' ]; then
    export PATH=/opt/homebrew/bin:${PATH}
fi

if [ -d "$(brew --prefix)/opt/coreutils/libexec/gnubin" ]; then
    ADD_PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:${ADD_PATH}"
    alias ls="ls --color --group-directories-first"
fi
if [ -d "$(brew --prefix)/opt/findutils/libexec/gnubin" ]; then
    ADD_PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:${ADD_PATH}"
fi
if [ -d "$(brew --prefix)/opt/gnu-sed/libexec/gnubin" ]; then
    ADD_PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:${ADD_PATH}"
fi
export PATH=${ADD_PATH}:${PATH}


source $(brew --prefix)/Cellar/zinit/*/zinit.zsh

# https://github.com/zdharma-continuum/zinit/blob/master/_zinit
zinit ice depth"1" atload"zicompinit" as"completion" wait lucid
zinit snippet https://github.com/zdharma-continuum/zinit/blob/main/_zinit

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
    export SPACESHIP_GIT_STATUS_DELETED=""
    export SPACESHIP_GIT_STATUS_STASHED="ﲐ"
    export SPACESHIP_GIT_STATUS_UNMERGED=""
    export SPACESHIP_GIT_STATUS_AHEAD=""
    export SPACESHIP_GIT_STATUS_BEHIND=""
    export SPACESHIP_GIT_STATUS_DIVERGED=""
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
zinit ice depth"1"
zinit snippet OMZP::vi-mode
    export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=false
    export VI_MODE_SET_CURSOR=true

zinit ice depth"1"
zinit snippet OMZL::completion.zsh

# https://github.com/zsh-users/zsh-autosuggestions
zinit ice atinit"zicompinit" depth"1"
zinit light zsh-users/zsh-autosuggestions
    bindkey '^ ' autosuggest-execute
    bindkey -a '^ ' autosuggest-execute

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/autojump
zinit ice depth"1"
zinit snippet OMZP::autojump

# https://github.com/marzocchi/zsh-notify
# To trick zsh-notify into thinking that it is a valid program
export TERM_PROGRAM='Apple_Terminal'
zinit ice depth"1"
zinit light marzocchi/zsh-notify
    zstyle ':notify:*' command-complete-timeout 10
    zstyle ':notify:*' error-sound "Sosumi"
    zstyle ':notify:*' success-sound "Blow"

# https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit ice depth"1" wait"1" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rbenv
zinit ice wait"2" lucid
zinit snippet OMZP::rbenv
#
# https://github.com/Aloxaf/fzf-tab
# tab
local fzf_bindkey="bindkey \"^I\" expand-or-complete;"
fzf_bindkey="${fzf_bindkey}bindkey -a \"^I\" expand-or-complete;"
# ctrl-/
fzf_bindkey="${fzf_bindkey}bindkey \"^_\" fzf-tab-complete;"
fzf_bindkey="${fzf_bindkey}bindkey -a \"^_\" fzf-tab-complete;"
zinit ice depth"1" atinit"zicompinit" \
          atload"${fzf_bindkey}" \
          wait"2" lucid
zinit light Aloxaf/fzf-tab
    zstyle ':fzf-tab:complete:ls*:*' fzf-preview 'bat -n --color=auto $realpath'
    zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat -n --color=auto $realpath'
    zstyle ':fzf-tab:*' fzf-bindings 'bspace:backward-delete-char/eof' 'ctrl-space:toggle+down' 'ctrl-/:toggle-preview'

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jenv
zinit ice wait"5" lucid
zinit snippet OMZP::jenv

# https://github.com/Tarrasch/zsh-bd
zinit ice depth"1" wait"5" lucid
zinit light Tarrasch/zsh-bd

# https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv
zinit ice depth"1" wait"5" lucid
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# https://github.com/ptavares/zsh-direnv
zinit ice depth"1" wait"2" lucid
zinit load ptavares/zsh-direnv



# ZSH completion
# ===============

# https://github.com/gradle/gradle-completion
zinit ice depth"1" atload"zicompinit" as"completion" wait"2" lucid
zinit light gradle/gradle-completion

# https://docs.docker.com/compose/completion
zinit ice depth"1" atload"zicompinit" as"completion" wait"2" lucid
zinit snippet https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose

# https://github.com/zsh-users/zsh-completions/blob/master/src/_rails
zinit ice depth"1" atload"zicompinit" as"completion" wait"2" lucid
zinit snippet https://github.com/zsh-users/zsh-completions/blob/master/src/_rails

# https://github.com/zsh-users/zsh-completions/blob/master/src/_bundle
zinit ice depth"1" atload"zicompinit" as"completion" wait"2" lucid
zinit snippet https://github.com/zsh-users/zsh-completions/blob/master/src/_bundle

# Local zle
# ==========

function gitcheckall {
    check_targets=(`find ${1:-.} -name '.git' | xargs -n 1 dirname`)

    echo "Update git remote..."
    wait_list=()
    for target in $check_targets; do
        git -C ${target} remote update > /dev/null 2>&1 & wait_list+=($!)
    done

    for i in $wait_list; do
        wait $i
    done

    clear
    echo "Check git..."
    for target in $check_targets; do
        if [ $(git -C ${target} rev-parse --abbrev-ref HEAD) = "HEAD" ]; then
            # ignore detached head
            continue
        fi
        _gitcheck $target
    done
}

function _gitcheck {
    target=$1


    upstream='@{u}'
    local_hash=`git -C ${target} rev-parse @`
    remote_hash=`git -C ${target} rev-parse "${upstream}"`
    base_hash=`git -C ${target} merge-base @ "${upstream}"`
    git_status=`git -C ${target} status -s`

    if [ ${local_hash} != ${remote_hash} ] || [ "${git_status}" != "" ]; then
        echo "\n>> ${target}:"

        if [ "${git_status}" != "" ]; then
            echo $git_status
        fi

        if [ ${local_hash} = ${remote_hash} ]; then
            continue
        elif [ ${local_hash} = ${base_hash} ]; then
            echo "Need to pull"
        elif [ ${remote_hash} = ${base_hash} ]; then
            echo "Need to push"
        else
            echo "Diverged"
        fi
    fi
}

function sedreplace {
    sed_string=$1
    target=${2:-.}

    fd ${target} --type=f --exec sed -i "${sed_string}"
}

# TODO make a plugin out of this
# TODO unable to clear multiple lines
# function clean-history-by-buffer {
#   local regex=$BUFFER
#   regex=$(sed "s/\([\\/[!.*]\)/\\\\\1/g" <<< $BUFFER)
#   sed "/^${regex}\$/d" $HISTFILE > ${HISTFILE}.tmp
#   mv ${HISTFILE}.tmp ${HISTFILE}
#   BUFFER=
#   zle history-beginning-search-backward
# }
# zle -N clean-history-by-buffer
# bindkey "^H" clean-history-by-buffer
# bindkey -a "^H" clean-history-by-buffer

# Key Bindings
# =============

# ctrl-n
bindkey '^N' history-beginning-search-forward
bindkey -a '^N' history-beginning-search-forward
# ctrl-p
bindkey '^P' history-beginning-search-backward
bindkey -a '^P' history-beginning-search-backward
# ctrl-t
bindkey '^T' push-input
bindkey -a '^T' push-input
# ctrl-u
bindkey '^U' backward-kill-line
bindkey -a '^U' backward-kill-line
# shift-tab
bindkey '^[[Z' reverse-menu-complete
bindkey -a '^[[Z' reverse-menu-complete

# Shell Colorscheme
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="nvim"

# Expand History Stored
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE

# setopt references: https://zsh.sourceforge.io/Doc/Release/Options.html
# Don't store duplicate history and spaces
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history_time

# Stop the annoying sound
setopt nobeep

export FZF_DEFAULT_COMMAND='fd --type f'
export RIPGREP_CONFIG_PATH=${HOME}/.ripgreprc

# Ctrl-w deletes alphanumeric and the following characters
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
alias vim="nvim";
alias v="nvim";
alias g="git"
alias gg="lazygit"
alias k="kubectl"
alias be="bundle exec"
alias r="rg"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Custom loading other command
local exec_commands="eval \"$(pyenv init --path)\";"
exec_commands="${exec_commands}eval `nodenv init - zsh`;"
exec_commands="${exec_commands}source \"$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc\";"
exec_commands="${exec_commands}source \"$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc\";"
exec_commands="${exec_commands}source <(kubectl completion zsh);"
zinit ice atload"${exec_commands}" \
          wait"2" lucid
zinit light zdharma-continuum/null

# Android Development
if [ -d $HOME/Library/Android/sdk ]; then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

test -f ~/.zshrc_local && source ~/.zshrc_local
