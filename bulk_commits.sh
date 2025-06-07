#!/bin/bash

repo_dir="test-contributions"
mkdir -p "$repo_dir"
cd "$repo_dir"
git init

# Configure Git username and email (replace with your info)
git config user.name "azxixy"
git config user.email "nicholasisoliz@gmail.com"

# Create a file to commit
touch contributions.txt
git add contributions.txt
git commit -m "Initial commit"

# Add commits for multiple past days
for i in {1..30}; do
  echo "Contribution $i" >> contributions.txt
  git add contributions.txt
  
  # Set commit date back i days
  GIT_COMMITTER_DATE="$(date -d "$i days ago" --iso-8601=seconds)" \
  git commit --date "$(date -d "$i days ago" --iso-8601=seconds)" -m "Commit $i"
done

# Add remote and push to GitHub (replace URL with your repo URL)
git remote add origin https://github.com/azxixy/Test
git branch -M main
git push -u origin main
