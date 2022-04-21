#!/usr/bin/env bash

set eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
CURRENT_ZSH=`which zsh`

grep -q $CURRENT_ZSH /etc/shells || echo $CURRENT_ZSH | sudo tee -a /etc/shells > /dev/null
[ $SHELL = `which zsh` ] || chsh -s $CURRENT_ZSH

ln -sfn ${APP_PATH}/zshrc ${HOME}/.zshrc
ln -sfn ${APP_PATH}/bundle-config ${HOME}/.bundle/config
ln -sfn ${APP_PATH}/p10k.zsh ${HOME}/.p10k.zsh
ln -sfn ${APP_PATH}/config/ripgreprc ${HOME}/.ripgreprc
ln -sfn ${APP_PATH}/config/rgignore ${HOME}/.rgignore

# cron
ln -sfn ${APP_PATH}/cron ${HOME}/.cron-script
export > ${APP_PATH}/cron/envfile
crontab < ${APP_PATH}/crontab

# lazygit
ln -sfn ${APP_PATH}/lazygit_config.yml "$(lazygit -cd)/config.yml"
