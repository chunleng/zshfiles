#!/bin/bash

set -eu

UPDATE_LIST=`pip3 list --disable-pip-version-check --outdated --format=freeze`

if [ "$UPDATE_LIST" != "" ]; then
  echo $UPDATE_LIST | grep -v '^\-e' | cut -d'=' -f1 | xargs -n1 pip3 install -U
fi
