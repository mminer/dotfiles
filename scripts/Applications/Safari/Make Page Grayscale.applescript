-- requires that ÒAllow JavaScript from Apple EventsÓ be turned on in Settings > Developer
tell application "Safari"
	do JavaScript "document.getElementsByTagName('html')[0].style.filter = 'grayscale()'" in current tab of window 1
end tell