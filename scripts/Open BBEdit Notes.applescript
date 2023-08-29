tell application "BBEdit"
	activate
end tell

tell application "System Events" to tell process "BBEdit"
	click menu item "Notes" of menu 1 of menu bar item "Window" of menu bar 1
end tell
