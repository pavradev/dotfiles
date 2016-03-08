#!/bin/bash
# Setub script for configuring Ubuntu 14.04 EC2 instance

# Install curl if not installed
sudo apt-get install -y curl

# Install git
sudo apt-get install -y git

# Install node and npm using nvm: node version manager
# https://github.com/creationix/nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh
. ~/.nvm/nvm.sh
nvm install 5.0
nvm use 5.0

# Install npm packages
npm install -g grunt-cli bower
# Yeoman scaffolding tool and angular-fullstack code generator
# http://yeoman.io/
npm install -g yo generator-angular-fullstack
### need to install additional packages for PhantomJS ? http://phantomjs.org/download.html

### Install heroku ?

# git pull and install dotfiles
#cd $HOME
#if [ -d ./dotfiles/ ]; then
#    mv dotfiles dotfiles.old
#fi
#if [ -d .emacs.d/ ]; then
#    mv .emacs.d .emacs.d~
#fi
#git clone https://github.com/startup-class/dotfiles.git
#ln -sb dotfiles/.screenrc .
#ln -sb dotfiles/.bash_profile .
#ln -sb dotfiles/.bashrc .
#ln -sb dotfiles/.bashrc_custom .
#ln -sf dotfiles/.emacs.d .

# Create repositories directory
cd $HOME
if [ -d ./repositories/ ]; then
    mv repositories repositories.old
fi
mkdir $HOME/repositories

# Install and configure docker
# https://docs.docker.com/linux/step_one/
##curl -fsSL https://get.docker.com/ | sh
# Run docker without sudo (need to re-login to apply changes)
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
##sudo usermod -aG docker ubuntu
