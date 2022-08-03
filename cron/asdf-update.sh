#!/bin/bash

set -eu

asdf install neovim nightly && \
  rm -rf ~/.asdf/installs/neovim/nightly.bak && \
  mv ~/.asdf/installs/neovim/nightly{,.bak} && \
  asdf global neovim nightly.bak && \
  asdf install neovim nightly && \
  asdf global neovim nightly
asdf install nodejs lts-gallium && \
  rm -rf ~/.asdf/installs/nodejs/lts-gallium.bak && \
  mv ~/.asdf/installs/nodejs/lts-gallium{,.bak} && \
  asdf global nodejs lts-gallium.bak && \
  asdf install nodejs lts-gallium && \
  asdf global nodejs lts-gallium
