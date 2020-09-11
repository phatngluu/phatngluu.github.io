#!/bin/sh

echo "Deleting old publication"
rm -rf docs

echo "Generating..."
hugo

echo "Moving uploads to static/uploads"
cd docs && mkdir static
mv -f uploads static/uploads

echo "Commiting docs..."
git add --all && git commit -m "auto-generate docs"

echo "Pushing..."
git push

echo "Published to /docs."
