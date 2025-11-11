#!/bin/bash
# Script to commit and push changes in a submodule, then update the parent repo
# Usage: ./commit-submodule.sh <submodule-path> <commit-message>

set -e  # Exit on error

if [ $# -lt 2 ]; then
    echo "Usage: ./commit-submodule.sh <submodule-path> <commit-message>"
    echo "Example: ./commit-submodule.sh civiclens-api \"Add new API endpoint\""
    exit 1
fi

SUBMODULE=$1
MESSAGE=$2

# Check if submodule directory exists
if [ ! -d "$SUBMODULE" ]; then
    echo "Error: Submodule directory '$SUBMODULE' not found"
    exit 1
fi

echo "📦 Committing changes in submodule: $SUBMODULE"
cd "$SUBMODULE"

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "⚠️  No changes to commit in submodule"
else
    git add .
    git commit -m "$MESSAGE"
    echo "✅ Committed changes in submodule"
fi

echo "⬆️  Pushing submodule changes..."
git push
echo "✅ Pushed submodule changes"

cd ..

echo "📝 Updating parent repo reference to submodule..."
git add "$SUBMODULE"
git commit -m "Update $SUBMODULE submodule"
echo "✅ Committed parent repo update"

echo "⬆️  Pushing parent repo..."
git push
echo "✅ All done! Submodule and parent repo updated."
