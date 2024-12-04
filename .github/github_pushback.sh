#! /bin/bash

echo "${PWD##*/}" | grep "gitea-pika-first-setup" || echo "No push back here" && exit 0

git remote set-url origin git@git.pika-os.com:custom-gui-packages/pika-first-setup

# Commit changes to git
git config --global user.name 'Github Mirror Push Back - Ward'
git config --global user.email 'hotrod.master@hotmail.com'
git config --global --add safe.directory /__w/gitea-pika-first-setup/gitea-pika-first-setup
git add .
git commit -am"Github Mirror Push Back"
git push
