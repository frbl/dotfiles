#!/bin/bash
cd "$HOME/Workspace/frbl/dotfiles"
git pull

CACHE_LOCATION="$HOME/.cache/dotfiles"
cp -r $CACHE_LOCATION/* .
git pull
git status

git add --all
git commit -am 'Updating local changes'
git push

cd $CACHE_LOCATION
git co -- .
git pull
