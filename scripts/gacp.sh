#!/bin/bash

# Exit immediately if any command fails
set -e

# 1. Check if a commit message was provided
if [ $# -eq 0 ]; then
    echo "Error: No commit message provided."
    echo "Usage: $0 \"Your commit message\""
    exit 1
fi

# 2. Get the current branch name
# errors out here.
BRANCH=$(git rev-parse --abbrev-ref HEAD)



# 3. Run the Git commands
echo "Staging files..."
git add -A  # Use -A to stage all changes (new, modified, deleted)

echo "Committing with message: \"$1\""
git commit -m "$1"

echo "Pushing to origin $BRANCH..."
git push origin "$BRANCH"

echo "Process Executed"
