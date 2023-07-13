#!/bin/bash

set -eu

asdf install neovim nightly && \
  rm -rf ~/.asdf/installs/neovim/nightly.bak && \
  mv ~/.asdf/installs/neovim/nightly{,.bak} && \
  asdf global neovim nightly.bak && \
  asdf install neovim nightly && \
  asdf global neovim nightly
