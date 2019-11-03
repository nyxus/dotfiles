#!/bin/sh
sudo apt-get update
sudo apt-get install ansible -y
wget -P /tmp/ https://raw.githubusercontent.com/nyxus/dotfiles/master/dotfiles/setup-environment.yml
ansible-playbook /tmp/setup-environment.yml --ask-become-pass
