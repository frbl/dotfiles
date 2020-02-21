#!/bin/bash
cd "$HOME/Workspace/frbl/dotfiles"
CACHE_LOCATION="$HOME/.cache/dotfiles"
cp -r $CACHE_LOCATION/* .
git status

git add --all
git commit -am 'Updating local changes'
git pull
git push

cd $CACHE_LOCATION
git co -- .
git pull
