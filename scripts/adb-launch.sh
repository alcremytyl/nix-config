#!/usr/bin/env bash

if ! adb get-state 1>/dev/null 2>&1; then
  echo "device not connected"
  exit 1
fi

GAME=$1 

if [[ -z "${1+x}" ]]; then
  scrcpy --list-apps
  exit 1
fi

scrcpy \
  --stay-awake \
  --turn-screen-off \
  --max-size=0 \
  --video-codec=h265 \
  --max-fps=60 \
  --new-display \
  --start-app=com.YoStarEN.Arknights
