-- http://automatedwork.server323.com/2012/02/22/applescripts-for-marking-messages-as-read-in-mac-mail/
tell application "Mail"
    set read status of every message of inbox to true
end tell