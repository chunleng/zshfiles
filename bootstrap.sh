#!/usr/bin/env bash

set eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
CURRENT_ZSH=`which zsh`

grep -q $CURRENT_ZSH /etc/shells || echo $CURRENT_ZSH | sudo tee -a /etc/shells > /dev/null
chsh -s $CURRENT_ZSH

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Update submodule
git submodule init
git submodule update --recursive

# Confirmation existence of necessary folders
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.zsh_custom/themes

ln -sfn ${APP_PATH}/zshrc ${HOME}/.zshrc
ln -sfn ${APP_PATH}/base16-shell ${HOME}/.config/base16-shell
ln -sfn ${APP_PATH}/themes/spaceship-prompt/spaceship.zsh-theme ${HOME}/.zsh_custom/themes
ln -sfn ${APP_PATH}/plugins ${HOME}/.zsh_custom/plugins
