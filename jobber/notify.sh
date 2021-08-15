#!/bin/bash

set -eu

# https://dshearer.github.io/jobber/doc/v1.4/#notifications
# STDIN consists of the format of run record
# {
#   "version": "1.4",
#   "job": {
#     "name": "DailyBackup",
#     "command": "/usr/local/bin/backup /home/bob/documents",
#     "time": "0 0 13 * * *",
#     "status": "Good"
#   },
#   "user": "bob",
#   "startTime": 1543150800,
#   "succeeded": true,
#   "stdout": "Backing up...\nSuccess",
#   "stderr": ""
# }
STDIN=$(cat -)
NAME=$(jq .job.name <<< $STDIN)
SUCCESS=$(jq -r .succeeded <<< $STDIN)
STARTTIME=$(jq -r .startTime <<< $STDIN)

terminal-notifier -title 'Jobber' \
                  -message "Job ${NAME} is running into some issue" \
                  -sound 'Sosumi'
