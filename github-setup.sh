echo -n "Enter your name and press [ENTER]: "
read name
echo -n "Enter your email and press [ENTER]: "
read email

# TODO Check if github_rsa already exist
ssh-keygen -t rsa -b 4096 -C "$email" -N "" -f $HOME/.ssh/github_rsa
# Add key to ssh agent
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/github_rsa

# Configure git
git config --global user.name "$name"
git config --global user.email "$email"

# Update .ssh/config file
echo Host github.com >> $HOME/.ssh/config
echo HostName github.com >> $HOME/.ssh/config
echo User git >> $HOME/.ssh/config
echo IdentityFile ~/.ssh/github_rsa >> $HOME/.ssh/config

# End
echo Add generated github_rsa key to your github account and run "ssh -T git@github.com" command to test
