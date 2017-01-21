#!/bin/bash

# Setup java
mkdir -p ~/local/java && cd ~/local/java
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz
tar xzvf jdk-8u101-linux-x64.tar.gz
echo 'export JAVA_HOME="/home/ubuntu/local/java/jdk1.8.0_101"' >> ~/.bash_profile

# Setup maven
mkdir -p ~/local/maven && cd ~/local/maven
wget http://apache.mirrors.spacedump.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xzvf apache-maven-3.3.9-bin.tar.gz
echo 'export PATH="/home/ubuntu/local/maven/apache-maven-3.3.9/bin:$PATH"' >> ~/.bash_profile

