#!/bin/bash
CACHE_LOCATION="$HOME/.cache/dotfiles"
cd CACHE_LOCATION
git pull

cd "$HOME/Workspace/frbl/dotfiles"
git pull

cp -r $CACHE_LOCATION/* .
git status

git add --all
git commit -am 'Updating local changes'
git push

cd $CACHE_LOCATION
git co -- .
git pull
