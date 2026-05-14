#!/usr/bin/env bash

set -euo pipefail

#
# macOS
#
if [[ "${OSTYPE:-}" == darwin* ]]; then
  ps -A -o %cpu \
    | awk '{s+=$1} END {printf("%.0f", s)}'
  exit 0
fi

#
# Linux / WSL
#
if command -v top >/dev/null 2>&1; then
  top -bn1 \
    | awk '/Cpu/ {
        usage = 100 - $8
        printf("%.0f", usage)
        exit
      }'
  exit 0
fi

echo "--"
