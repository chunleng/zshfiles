#!/bin/bash

# Pomodoro timer. State persists across refreshes in a file:
# line1: phase (work|break), line2: phase start epoch,
# line3: paused (0|1), line4: pause start epoch

STATE_FILE="${TMPDIR:-/tmp/}pomodoro.state"
WORK_SECS=1500
BREAK_SECS=300

# atomic state write: readers never see a partially written file
write_state() {
  printf '%s\n%s\n%s\n%s\n' "$1" "$2" "$3" "$4" > "$STATE_FILE.tmp"
  mv "$STATE_FILE.tmp" "$STATE_FILE"
}

if [ "$1" = "toggle" ]; then
  now=$(date +%s)
  if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"
  else
    write_state work "$now" 0 0
  fi
  exit 0
fi

if [ "$1" = "pause" ] && [ -f "$STATE_FILE" ]; then
  now=$(date +%s)
  {
    read -r phase
    read -r start
    read -r paused
    read -r pause_ts
  } < "$STATE_FILE"
  if [ "$paused" = "1" ]; then
    # shift start forward by the time spent paused, keeping remaining time
    write_state "$phase" "$((start + now - pause_ts))" 0 0
  else
    write_state "$phase" "$start" 1 "$now"
  fi
  exit 0
fi

if [ ! -f "$STATE_FILE" ]; then
  # inactive: exit immediately, keep the 200ms poll near-zero cost
  echo '󰔛| font="Hack Nerd Font"'
  echo "---"
  echo "Start | shell=$0 param1=toggle terminal=false refresh=true shortcut=CTRL+OPTION+SHIFT+K"
  exit 0
fi

now=$(date +%s)
{
  read -r phase
  read -r start
  read -r paused
  read -r pause_ts
} < "$STATE_FILE"

if [ "$paused" = "1" ]; then
  elapsed=$((pause_ts - start))
else
  # advance phases while the current one has fully elapsed
  transitioned=0
  while :; do
    if [ "$phase" = "work" ]; then dur=$WORK_SECS; else dur=$BREAK_SECS; fi
    elapsed=$((now - start))
    if [ "$elapsed" -lt "$dur" ]; then break; fi
    start=$((start + dur))
    if [ "$phase" = "work" ]; then phase=break; else phase=work; fi
    transitioned=1
  done
  # write only on transition: keeps polling read-only so a concurrent
  # pause/toggle write can't be clobbered by a stale rewrite
  if [ "$transitioned" = "1" ]; then
    write_state "$phase" "$start" 0 0
    if [ "$phase" = "work" ]; then
      terminal-notifier -title "Pomodoro" -message "Break over, back to work" -group "pomodoro" -sound Glass
    else
      terminal-notifier -title "Pomodoro" -message "Work done, take a break" -group "pomodoro" -sound Glass
    fi
  fi
fi

if [ "$phase" = "work" ]; then dur=$WORK_SECS; else dur=$BREAK_SECS; fi
remaining=$((dur - elapsed))
min=$((remaining / 60))
sec=$((remaining % 60))

if [ "$paused" = "1" ]; then
  icon="󰏤 "
elif [ "$phase" = "work" ]; then
  icon="󰐊 "
else
  icon="󰓛 "
fi

printf '%s%02d:%02d | font="Hack Nerd Font"' "$icon" "$min" "$sec"
echo "---"
if [ "$paused" = "1" ]; then
  echo "Resume | shell=$0 param1=pause terminal=false refresh=true shortcut=CTRL+OPTION+SHIFT+L"
else
  echo "Pause | shell=$0 param1=pause terminal=false refresh=true shortcut=CTRL+OPTION+SHIFT+L"
fi
echo "Stop | shell=$0 param1=toggle terminal=false refresh=true shortcut=CTRL+OPTION+SHIFT+K"
