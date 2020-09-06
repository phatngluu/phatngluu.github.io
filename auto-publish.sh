#!/bin/sh

if [ "`git status -s`" ]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf public

echo "Generating site"
hugo

git add public && git commit -m "public -> gh-pages"
git subtree push --prefix public origin gh-pages

# git worktree add -B gh-pages public origin/gh-pages

echo "Pushing to github"
git push --all

echo "Deleting public folder"
rm -rf public

echo "Published."
