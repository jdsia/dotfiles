#!/bin/bash

#PIC=$(find ~/Pictures/ -type f | rofi -dmenu)
#
#feh --bg-scale $PIC
#[ $(echo -e "No\nYes" | rofi -dmenu -p "Do you want to copy filepath to clipboard?") == "Yes" ] && echo $PIC | xclip -selection clipboard

#!/bin/bash


# Find files, but only common image types
# Pipe the results to awk to format for rofi thumbnails
#   %s\0icon\x1f%s\n  =  [full_path]\0icon\x1f[full_path]\n
PIC=$(find ~/Pictures/ -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | \
    awk '{printf "%s\0icon\x1f%s\n", $0, $0}' | \
    rofi -dmenu -i -p "Select Picture" -theme-str "element-icon { size: 64px; }")

# Exit if rofi was cancelled (PIC variable is empty)
if [ -z "$PIC" ]; then
    exit 0
fi

# The rest of your script (now with quotes for safety)
feh --bg-scale "$PIC"
[ $(echo -e "No\nYes" | rofi -dmenu -p "Do you want to copy filepath to clipboard?") == "Yes" ] && echo "$PIC" | xclip -selection clipboard
