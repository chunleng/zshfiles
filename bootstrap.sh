#!/usr/bin/env bash

set eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
CURRENT_ZSH=`which zsh`

grep -q $CURRENT_ZSH /etc/shells || echo $CURRENT_ZSH | sudo tee -a /etc/shells > /dev/null
[ $SHELL = `which zsh` ] || chsh -s $CURRENT_ZSH

ln -sfn ${APP_PATH}/zshrc ${HOME}/.zshrc
mkdir -p ${HOME}/.bundle && ln -sfn ${APP_PATH}/bundle-config ${HOME}/.bundle/config
ln -sfn ${APP_PATH}/p10k.zsh ${HOME}/.p10k.zsh
ln -sfn ${APP_PATH}/config/ripgreprc ${HOME}/.ripgreprc
ln -sfn ${APP_PATH}/config/rgignore ${HOME}/.rgignore
mkdir -p ${HOME}/.config/spotify-player && \
    ln -sfn ${APP_PATH}/config/spotify/app.toml ${HOME}/.config/spotify-player/app.toml.example && \
    ln -sfn ${APP_PATH}/config/spotify/keymap.toml ${HOME}/.config/spotify-player/keymap.toml && \
    ln -sfn ${APP_PATH}/config/spotify/theme.toml ${HOME}/.config/spotify-player/theme.toml


# cron
ln -sfn ${APP_PATH}/cron ${HOME}/.cron-script
export > ${APP_PATH}/cron/envfile
crontab < ${APP_PATH}/crontab

# custom autoload functions
ln -sfn ${APP_PATH}/functions ${HOME}/.zsh_functions

# lazygit
ln -sfn ${APP_PATH}/lazygit_config.yml "${HOME}/.lg_config.yml"

# claude
ln -sfn ${APP_PATH}/claude/CLAUDE.md ${HOME}/.claude/CLAUDE.md
ln -sfn ${APP_PATH}/claude/settings.json ${HOME}/.claude/settings.json
ln -sfn ${APP_PATH}/claude/agents ${HOME}/.claude/agents
