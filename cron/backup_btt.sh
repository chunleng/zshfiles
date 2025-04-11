#!/usr/bin/env bash

set -eu

file_to_update="${HOME}/workspace-bootstrap/git/chunleng/bttfiles/Default.bttpreset"

osascript -e "tell application \"BetterTouchTool\"
	export_preset \"Default\" outputPath \"${file_to_update}\" with includeSettings
end tell"

jq -S 'del(.. | objects | .BTTPresetUUID?, .BTTLastUpdatedAt) | walk(if type == "array" then sort else . end)' "${file_to_update}" > "${file_to_update}.tmp"
mv "${file_to_update}.tmp" "${file_to_update}"
