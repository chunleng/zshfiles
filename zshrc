# Enable Powerlevel10k instant prompt
if [[ -r "${HOME}/.cache/p10k-instant-prompt-${%n}.zsh" ]]; then
  source "${HOME}/.cache/p10k-instant-prompt-${%n}.zsh"
fi

brew_prefix=/usr/local
if [ $(uname -m) = 'arm64' ]; then
    brew_prefix=/opt/homebrew
    export PATH=${brew_prefix}/bin:${PATH}
fi

if [ -d "${brew_prefix}/opt/coreutils/libexec/gnubin" ]; then
    ADD_PATH="${brew_prefix}/opt/coreutils/libexec/gnubin:${ADD_PATH}"
    alias ls="ls --color --group-directories-first"
fi
if [ -d "${brew_prefix}/opt/findutils/libexec/gnubin" ]; then
    ADD_PATH="${brew_prefix}/opt/findutils/libexec/gnubin:${ADD_PATH}"
fi
if [ -d "${brew_prefix}/opt/gnu-sed/libexec/gnubin" ]; then
    ADD_PATH="${brew_prefix}/opt/gnu-sed/libexec/gnubin:${ADD_PATH}"
fi
if [ -d "${HOME}/.cargo/bin" ]; then
    ADD_PATH="${HOME}/.cargo/bin:${ADD_PATH}"
fi
if [ -d "${brew_prefix}/opt/ruby/bin" ]; then
    ADD_PATH="${brew_prefix}/opt/ruby/bin:${ADD_PATH}"
fi
export PATH=${ADD_PATH}:${PATH}


source ${brew_prefix}/Cellar/zinit/*/zinit.zsh

# https://github.com/zdharma-continuum/zinit/blob/master/_zinit
zinit ice depth"1" atload"zicompinit" as"completion" wait lucid
zinit snippet https://github.com/zdharma-continuum/zinit/blob/main/_zinit

# https://github.com/romkatv/powerlevel10k
zinit ice depth"1" atload"[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh"
zinit light romkatv/powerlevel10k

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

# autojump setup
zinit ice depth"1" lucid
zinit snippet ${brew_prefix}/etc/profile.d/autojump.sh

# https://github.com/marzocchi/zsh-notify
# To trick zsh-notify into thinking that it is a valid program
export TERM_PROGRAM='Apple_Terminal'
zinit ice depth"1" wait"1" lucid
zinit light marzocchi/zsh-notify
    zstyle ':notify:*' command-complete-timeout 30
    zstyle ':notify:*' error-sound "Sosumi"
    zstyle ':notify:*' success-sound "Blow"
    zstyle ':notify:*' blacklist-regex "nvim"

# https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit ice depth"1" wait"1" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rbenv
zinit ice wait"2" lucid
zinit snippet OMZP::rbenv

# https://github.com/Aloxaf/fzf-tab
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
zinit ice wait"0" lucid
zinit snippet OMZP::jenv

# https://github.com/ptavares/zsh-direnv
zinit ice depth"1" wait"0" lucid
zinit load ptavares/zsh-direnv

# # https://github.com/Tarrasch/zsh-bd
zinit ice depth"1" wait"2" lucid
zinit light Tarrasch/zsh-bd



# ZSH completion
# ===============

# https://github.com/gradle/gradle-completion
zinit ice depth"1" atload"zicompinit" as"completion" wait"1" lucid
zinit light gradle/gradle-completion

# https://docs.docker.com/compose/completion
zinit ice depth"1" atload"zicompinit" as"completion" wait"1" lucid
zinit snippet https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose

# https://github.com/zsh-users/zsh-completions/blob/master/src/_rails
zinit ice depth"1" atload"zicompinit" as"completion" wait"1" lucid
zinit snippet https://github.com/zsh-users/zsh-completions/blob/master/src/_rails

# https://github.com/zsh-users/zsh-completions/blob/master/src/_bundle
zinit ice depth"1" atload"zicompinit" as"completion" wait"1" lucid
zinit snippet https://github.com/zsh-users/zsh-completions/blob/master/src/_bundle

# rust cargo
if [ -d "${HOME}/.cargo/bin" ]; then
    zinit ice depth"1" atload"zicompinit" as"completion" wait"1" lucid
    zinit snippet ${HOME}/.rustup/toolchains/*/share/zsh/site-functions/_cargo
fi

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

function run-parallel {
    for command in "$@"; do
        eval "$command &"
    done
    function exit_run_parallel {
        trap "exit_run_parallel" INT
        fg
    }
    exit_run_parallel
}

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

# Custom loading other command
local exec_commands="source \"${brew_prefix}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc\";"
exec_commands="${exec_commands}source \"${brew_prefix}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc\";"
exec_commands="${exec_commands}source <(kubectl completion zsh);"
exec_commands="${exec_commands}rustup completions zsh > ~/.zinit/completions/_rustup;"
zinit ice atload"${exec_commands}" wait"1" lucid
zinit light zdharma-continuum/null

local exec_commands="eval \"\$(pyenv init --path)\";"
exec_commands="${exec_commands}eval \"\$(pyenv init -)\";"
exec_commands="${exec_commands}eval \"\$(nodenv init - zsh)\";"
zinit ice atload"${exec_commands}" wait"0" lucid
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
