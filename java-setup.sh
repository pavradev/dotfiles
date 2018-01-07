#!/bin/bash

# Setup java
mkdir -p ~/local/java && cd ~/local/java
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz
tar xzvf jdk-8u141-linux-x64.tar.gz
echo 'export JAVA_HOME="/home/ubuntu/local/java/jdk1.8.0_141"' >> ~/.bash_profile

# Setup maven
mkdir -p ~/local/maven && cd ~/local/maven
wget http://apache.mirrors.spacedump.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xzvf apache-maven-3.3.9-bin.tar.gz
echo 'export PATH="/home/ubuntu/local/maven/apache-maven-3.3.9/bin:$PATH"' >> ~/.bash_profile

