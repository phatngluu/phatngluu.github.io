#!/bin/sh

echo "Deleting old publication"
rm -rf docs

echo "Generating..."
hugo

echo "Moving uploads to static/uploads"
mv -f docs/uploads docs/static/uploads

echo "Commiting docs..."
cd docs && git add --all && git commit -m "auto-generate docs"

echo "Pushing..."
git push

echo "Published to /docs."
