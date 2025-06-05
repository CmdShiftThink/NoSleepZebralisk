#!/bin/bash
TARGET_DEVICE="ZEB-JUKE BAR 1000"
SOUND_FILE="$HOME/silent_ping.wav"
INTERVAL_SEC=450
CHECK_INTERVAL=30
SWITCH_AUDIO="/usr/local/bin/SwitchAudioSource"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

log "Starting ZEB-JUKE BAR 1000 keep-alive script."

while true; do
  CURRENT_OUTPUT=$("$SWITCH_AUDIO" -c)
  if [ "$CURRENT_OUTPUT" == "$TARGET_DEVICE" ]; then
    log "Output device is $CURRENT_OUTPUT. Playing low sound."
    afplay "$SOUND_FILE"
    sleep "$INTERVAL_SEC"
  else
    log "Output is '$CURRENT_OUTPUT'. Waiting for '$TARGET_DEVICE'..."
    sleep "$CHECK_INTERVAL"
  fi
done

