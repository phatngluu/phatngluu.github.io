1. Sign in to Github

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

2. Create new repo on Github
3. Initialize and stage changes and commit/push

```
git init
# Staged all files changes
git add .
# Unstaged all files changes
git rm -r --cached . 
# Commit
git commit -m "Message"
# Push
git remote add <repo_name> <url> # run it first time
git push -u origin master # run it first time
git push --set-upstream <repo_name> master # run it first time # optional
git push <repo_name> # run it next time
```

