#!/bin/bash

# Set your vault path here
VAULT_PATH="/home/digs/Vaults/diego"  # Replace with your actual path

cd "$VAULT_PATH" || { echo "Error: Vault directory not found"; exit 1; }

# Check for changes
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Add all changes, commit, and push
git add .
git commit -m "Automated hourly commit: $(date +'%Y-%m-%d %H:%M')"
git push origin main  # Replace 'main' with your branch name if different (e.g., 'master')

echo "Changes committed and pushed successfully."
