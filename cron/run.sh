#!/bin/bash

set -eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. ${APP_PATH}/envfile

JOB_NAME=$1
LOGFILE="/tmp/cronlog-${JOB_NAME}"
LOGFILESIZE=10000

date +"[%F %T] running new job" >> ${LOGFILE}
${APP_PATH}/${JOB_NAME}.sh >> ${LOGFILE} 2>&1

if [ $? -eq 0 ]; then
  date +"[%F %T] job completed" >> ${LOGFILE}
else
  date +"[%F %T] [ERROR]" >> ${LOGFILE}
  terminal-notifier -title 'CRON' -message "Job ${JOB_NAME} is running into some issue" -sound 'Sosumi'
fi

# Trim Log
tail -n ${LOGFILESIZE} ${LOGFILE} > ${LOGFILE}.tmp
mv ${LOGFILE}{.tmp,}
