#!/usr/bin/env bash

set -euo pipefail

is_wsl() {
  grep -qi microsoft /proc/version 2>/dev/null
}

if [[ "${OSTYPE:-}" == darwin* ]]; then
  pmset -g batt \
    | grep -Eo '[0-9]+%' \
    | head -n 1 \
    | tr -d '%'
  exit 0
fi

if is_wsl; then
  powershell.exe -NoProfile -Command \
    "(Get-CimInstance Win32_Battery).EstimatedChargeRemaining" \
    2>/dev/null \
    | tr -d '\r' \
    | head -n 1
  exit 0
fi

for battery in /sys/class/power_supply/BAT*/capacity; do
  if [[ -r "$battery" ]]; then
    cat "$battery"
    exit 0
  fi
done

echo "--"
