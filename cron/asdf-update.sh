#!/bin/bash

set -eu

asdf uninstall neovim nightly && asdf install neovim nightly
asdf uninstall nodejs lts-gallium && asdf install nodejs lts-gallium
