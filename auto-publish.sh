#!/bin/sh

echo "Deleting old publication"
rm -rf docs

echo "Generating..."
hugo

echo "Commiting docs..."
cd public && git add --all && git commit -m "auto-generate docs"

echo "Pushing..."
git push

echo "Published to /docs."
