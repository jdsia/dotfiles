#!/bin/bash

# Replace this with your GitHub username
USERNAME="jdsia"

for repo in $(gh repo list $USERNAME --limit 100 --json name --jq '.[].name')
do
  gh repo edit "$USERNAME/$repo" --visibility private
done

