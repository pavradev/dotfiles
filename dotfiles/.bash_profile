# Factor out all repeated profile initialization into .bashrc
#  - All non-login shell parameters go there
#  - All declarations repeated for each screen session go there
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Configure PATH
#  - These are line by line so that you can kill one without affecting the others.
#  - Lowest priority first, highest priority last.
export PATH=$PATH
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#export M2_HOME=/usr/local/apache-maven-3.3.9
#export M2=$M2_HOME/bin
#export PATH=$M2:$PATH
