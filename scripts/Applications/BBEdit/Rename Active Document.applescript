-- https://daringfireball.net/2004/10/rename_active_document
tell application "BBEdit"
    activate
    set old_name to name of text window 1
    set dialog_result to display dialog Â
        "Rename active document:" default answer (old_name) Â
        buttons {"Cancel", "Rename"} default button 2 Â
        with icon note
    if button returned of dialog_result = "Rename" then
        set new_name to text returned of dialog_result
        set d to active document of text window 1
        if (d's on disk) then
            set the_file to d's file
            tell application "Finder"
                set name of the_file to new_name
            end tell
        else -- it's a document that has never been saved
            set name of d to new_name
        end if
    end if
end tell