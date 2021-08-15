#!/usr/bin/env bash

set eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
CURRENT_ZSH=`which zsh`

grep -q $CURRENT_ZSH /etc/shells || echo $CURRENT_ZSH | sudo tee -a /etc/shells > /dev/null
[ $SHELL = `which zsh` ] || chsh -s $CURRENT_ZSH

ln -sfn ${APP_PATH}/zshrc ${HOME}/.zshrc

# Install jobber
mkdir -p ${HOME}/.jobber-logs
ln -sfn ${APP_PATH}/jobber/jobber.yaml ${HOME}/.jobber
ln -sfn ${APP_PATH}/jobber/notify.sh ${HOME}/.jobber-notify.sh
jobber reload
