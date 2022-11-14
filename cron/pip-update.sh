#!/bin/bash

set -eu

UPDATE_LIST=`pip3 list --disable-pip-version-check --outdated --format=json|jq -r '.[].name'`

if [ "$UPDATE_LIST" != "" ]; then
  echo $UPDATE_LIST | xargs -n1 pip3 install -U
fi
