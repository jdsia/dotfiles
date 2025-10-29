
# source: Sylvan Franklin: https://youtu.be/YDd0MYtfIp8?si=qvfw0Q64nQ184t8E 

#cd $(tmux run "echo #{pane_start_path}")
#cd $(tmux run "echo #{pane_current_path}")
#url=$(git remote get-url origin) 
#
#if [[ $url == *github.com* ]]; then
#    if [[ $url == git@* ]]; then
#        url="${url#git@}"
#        url="${url/:/\/}" 
#        url="https://$url"
#    fi
#    open "$url"
#else
#    echo "This repository is not hosted on GitHub"
#fi

gh browse
