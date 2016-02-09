#!/bin/bash

if [ ! -d ".git" ]; then
    git init
    echo "[remote \"heroku\"]" >> .git/config
	echo "  url = https://git.heroku.com/sonos-lunch-time.git" >> .git/config
	echo "  fetch = +refs/heads/*:refs/remotes/heroku/*" >> .git/config
    git add .
    git commit -am "Initial create"
fi

git pull -s ours heroku master
git add .
git commit -am "Pushing latest version"
git push heroku master
