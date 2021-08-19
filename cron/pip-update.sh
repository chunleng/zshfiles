#!/bin/bash

set -eu

pip3 list --disable-pip-version-check --no-python-version-warning --outdated --format=freeze \
          | grep -v '^\-e' | cut -d'=' -f1 | xargs -n1 ${HOME}/.pyenv/shims/pip3 install -U
