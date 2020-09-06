#!/bin/sh

echo "Deleting old publication"
rm -rf docs

echo "Generating..."
hugo

echo "Published to /docs."
