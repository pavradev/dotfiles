#!/bin/bash
# Create github ssh key and set configuration

# Read command line parameters --name= --email=
for i in "$@"
do
case $i in
    --name=*)
    name="${i#*=}"
    shift # past argument=value
    ;;
    --email=*)
    email="${i#*=}"
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac
done

echo "Name is ${name}"
echo "Email is ${email}"

# If no command line parameters specify then ask user
if [ -z "${name}" ]; then
    echo -n "Enter your name and press [ENTER]: "
    read name
fi
if [ -z "${email}" ]; then
    echo -n "Enter your email and press [ENTER]: "
    read email
fi

# TODO Check if github_rsa already exist
ssh-keygen -t rsa -b 4096 -C "$email" -N "" -f $HOME/.ssh/github_rsa
# Add key to ssh agent
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/github_rsa

# Configure git
git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.editor "vim"
git config --global alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
git config --global alias.lg "!(git lg1)"

# Update .ssh/config file
echo Host github.com >> $HOME/.ssh/config
echo HostName github.com >> $HOME/.ssh/config
echo User git >> $HOME/.ssh/config
echo IdentityFile ~/.ssh/github_rsa >> $HOME/.ssh/config

# End
echo Add generated github_rsa key to your github account and run \"ssh -T git@github.com\" command to test
