#! /bin/bash

mkdir -p ~/.ssh
ssh-keyscan pika-os.com >> ~/.ssh/known_hosts
ssh-keyscan git.pika-os.com >> ~/.ssh/known_hosts
#echo -e "Host git.pika-os.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
#echo -e "Host git.pika-os.com\n\tIdentityFile ~/.ssh/id_rsa\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
#ssh-agent -a $SSH_AUTH_SOCK > /dev/null
#ssh-add - <<< "$1"

export GIT_SSH_COMMAND="ssh -F ~/.ssh/config"

ssh -vT git@git.pika-os.com

# Commit changes to git
git config --global user.name 'ferreo'
git config --global user.email 'harderthanfire@gmail.com'
git config --global --add safe.directory /__w/gitea-pika-first-setup/gitea-pika-first-setup
git remote set-url origin git@git.pika-os.com:custom-gui-packages/pika-first-setup
git add .
git commit -am"Github Mirror Push Back"
git push
