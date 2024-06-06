if application "/Applications/Google Chrome.app" is running then
    tell application "/Applications/Google Chrome.app"
        make new window
        activate
    end tell
else
    activate application "/Applications/Google Chrome.app" 
end if
