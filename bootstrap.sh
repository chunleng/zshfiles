#!/usr/bin/env bash

set eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
CURRENT_ZSH=`which zsh`

grep -q $CURRENT_ZSH /etc/shells || echo $CURRENT_ZSH | sudo tee -a /etc/shells > /dev/null
[ $SHELL = `which zsh` ] || chsh -s $CURRENT_ZSH

ln -sfn ${APP_PATH}/zshrc ${HOME}/.zshrc

# Install cron
launchctl unload ${APP_PATH}/launchd/local.brew.update.plist
launchctl load ${APP_PATH}/launchd/local.brew.update.plist
launchctl unload ${APP_PATH}/launchd/local.pip.update.plist
launchctl load ${APP_PATH}/launchd/local.pip.update.plist
launchctl unload ${APP_PATH}/launchd/local.docker.prune.plist
launchctl load ${APP_PATH}/launchd/local.docker.prune.plist
launchctl unload ${APP_PATH}/launchd/local.gcloud.update.plist
launchctl load ${APP_PATH}/launchd/local.gcloud.update.plist
