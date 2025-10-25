#!/bin/bash

bookmark="$(xclip -o)"
file="$HOME/Documents/School/Phone-Notes/bookmarks.md"
option="bookmark\nview"

optionchoice="$(echo -e "$option" | rofi -dmenu -i -p 'Choose an option')"

if [[ "$optionchoice" == "bookmark" ]]; then
    # Check if the bookmark already exists in the file
    if grep -Fxq "$bookmark" "$file"; then
        notify-send "Duplicate Bookmark" "This bookmark is already in the file."
    else
        # Append the full bookmark (text or link) to the file
        echo "$bookmark" >> "$file"
        notify-send "Bookmark Saved" "Your bookmark has been added to $file."
    fi
elif [[ "$optionchoice" == "view" ]]; then
    # Show all bookmarks in rofi, select one
    selected_bookmark=$(cat "$file" | rofi -dmenu -i -p 'Select a bookmark')
    
    # If a bookmark is selected, only use the first word for pasting
    if [[ -n "$selected_bookmark" ]]; then
        # Apply awk to only get the first word or text from the selected bookmark
        first_word=$(echo "$selected_bookmark" | awk '{print $1}')
        # Type the first word using xdotool
        xdotool type "$first_word"
    fi
else
    notify-send "Action Canceled" "No valid option selected."
fi

