#!/usr/bin/env bash
# hide-default-apps.sh
# Removes unwanted Apple apps from Launchpad.
# They cannot be fully deleted on macOS 15 (SIP-protected system volume).

APPS_TO_HIDE=("Music" "TV" "News" "Tips" "Terminal")

LAUNCHPAD_DB=$(find /private/var/folders -name com.apple.dock.launchpad -type d 2>/dev/null | head -1)/db/db

if [ ! -f "$LAUNCHPAD_DB" ]; then
  echo "Launchpad DB not found, skipping."
  exit 0
fi

echo "==> Hiding default Apple apps from Launchpad..."

for app in "${APPS_TO_HIDE[@]}"; do
  sqlite3 "$LAUNCHPAD_DB" "DELETE FROM apps WHERE title='$app';" 2>/dev/null && echo "    Removed: $app"
done

# Restart Dock to apply changes
killall Dock
echo "==> Done. Dock restarted."
