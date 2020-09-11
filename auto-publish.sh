#!/bin/sh

echo "Deleting old publication"
rm -rf docs

echo "Generating..."
hugo

echo "Moving uploads to static/uploads"
pwd
ls
cd docs && mkdir static
ls
mv -f uploads static/uploads

echo "Commiting docs..."
cd docs && git add --all && git commit -m "auto-generate docs"

echo "Pushing..."
git push

echo "Published to /docs."
