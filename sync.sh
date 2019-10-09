#!/bin/bash

git pull

CACHE_LOCATION="$HOME/.cache/dotfiles"
cp -r $CACHE_LOCATION/* .
git status

git add --all
git commit -am 'Updating local changes'
git push

cd $CACHE_LOCATION
mkdir -p CACHE_BACKUP
git status --short | awk {'print $2'} | xargs -I{} mv {} CACHE_BACKUP
git co -- .
git pull
