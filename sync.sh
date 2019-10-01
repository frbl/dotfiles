#!/bin/bash

git pull

CACHE_LOCATION="$HOME/.cache/dotfiles"
cp -r $CACHE_LOCATION/* .
git status

git commit -am 'Updating local changes'
git push
cd $CACHE_LOCATION
git pull
