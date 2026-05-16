#!/usr/bin/env bash

# Cycle through workspaces 1-5
# Usage: workspace-cycle.sh [next|prev]

DIRECTION="${1:-next}"
CURRENT=$(hyprctl activeworkspace -j | jq -r '.id')

if [ "$DIRECTION" = "next" ]; then
  if [ "$CURRENT" -ge 5 ]; then
    NEXT=1
  else
    NEXT=$((CURRENT + 1))
  fi
elif [ "$DIRECTION" = "prev" ]; then
  if [ "$CURRENT" -le 1 ]; then
    NEXT=5
  else
    NEXT=$((CURRENT - 1))
  fi
fi

hyprctl dispatch workspace "$NEXT"
