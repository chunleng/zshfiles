#!/bin/bash

set -eu

brew update
brew upgrade
brew upgrade neovim --fetch-HEAD
brew cleanup
