#! /bin/bash

if echo "${PWD##*/}" | grep "gitea-pika-first-setup"
then
    echo "This is github attempt pushback"
else
    echo "No push back here" && exit 1
fi

mkdir -p ~/.ssh
ssh-keyscan pika-os.com >> ~/.ssh/known_hosts
ssh-keyscan git.pika-os.com >> ~/.ssh/known_hosts
ssh-agent -a $SSH_AUTH_SOCK > /dev/null
ssh-add - <<< "$1"

ssh -vT git@git.pika-os.com

# Commit changes to git
git config --global user.name 'ferreo'
git config --global user.email 'harderthanfire@gmail.com'
git config --global --add safe.directory /__w/gitea-pika-first-setup/gitea-pika-first-setup
git remote set-url origin git@git.pika-os.com:custom-gui-packages/pika-first-setup
git add .
git commit -am"Github Mirror Push Back"
git push
