#!/usr/bin/env bash
# font-zoom.sh — Change Kitty font size and resize the OS window to keep the same cell count
# Usage: font-zoom.sh [+2.0|-2.0|0]

CHANGE="${1:++2.0}"

# Capture the focused window's id, cols, and rows before the font change
read -r WIN_ID COLS ROWS < <(
  kitty @ --to "$KITTY_LISTEN_ON" ls | python3 -c "
import sys, json
for os_win in json.load(sys.stdin):
    for tab in os_win['tabs']:
        for win in tab['windows']:
            if win.get('is_focused'):
                print(win['id'], win['columns'], win['lines'])
                sys.exit(0)
sys.exit(1)
"
)

[ -z "$WIN_ID" ] && exit 0

# Change font size for this specific window
kitty @ --to "$KITTY_LISTEN_ON" change-font-size --match "id:$WIN_ID" "$CHANGE"

# Give Kitty a moment to reflow after the font change
sleep 0.05

# Get the new dimensions for the same window
read -r NEW_COLS NEW_ROWS < <(
  kitty @ --to "$KITTY_LISTEN_ON" ls | python3 -c "
import sys, json
for os_win in json.load(sys.stdin):
    for tab in os_win['tabs']:
        for win in tab['windows']:
            if win['id'] == $WIN_ID:
                print(win['columns'], win['lines'])
                sys.exit(0)
sys.exit(1)
"
)

[ -z "$NEW_COLS" ] && exit 0

# How many cells did we lose/gain?
COLS_DELTA=$(( COLS - NEW_COLS ))
ROWS_DELTA=$(( ROWS - NEW_ROWS ))

# Resize the OS window to compensate, restoring the original cell count
[ "$COLS_DELTA" -ne 0 ] && \
  kitty @ --to "$KITTY_LISTEN_ON" resize-window --match "id:$WIN_ID" --axis x --increment "$COLS_DELTA"
[ "$ROWS_DELTA" -ne 0 ] && \
  kitty @ --to "$KITTY_LISTEN_ON" resize-window --match "id:$WIN_ID" --axis y --increment "$ROWS_DELTA"
