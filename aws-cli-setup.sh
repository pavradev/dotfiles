#!/bin/bash

#java check
echo "Checking Java"
which java
if [[ $? -eq 1 ]]; then
 echo "No Java found. Exiting."
 exit 1
fi
if [[ -z "$JAVA_HOME" ]]; then
 echo "No global JAVA_HOME variable found. Exiting."
 exit 1
fi 
echo "OK"

echo "# set aws CLI variables" >> ~/.bashrc

#set identity for CLI tools
if [[ -z "$AWS_ACCESS_KEY" ]]; then
 echo -n "Type your AWS access key and press ENTER: "
 read AWS_ACCESS_KEY
 echo 'export AWS_ACCESS_KEY='$AWS_ACCESS_KEY >> ~/.bashrc
else
 echo '$AWS_ACCESS_KEY already exists. Will not ask.'
fi

if [[ -z "$AWS_SECRET_KEY" ]]; then
 echo -n "Type your AWS access key and press ENTER: "
 read AWS_SECRET_KEY
 echo 'export AWS_SECRET_KEY='$AWS_SECRET_KEY >> ~/.bashrc
else
 echo '$AWS_SECRET_KEY already exists. Will not ask.'
fi

#download and install aws tools
if [[ -f ec2-api-tools.zip ]]; then
 rm ec2-api-tools.zip
fi
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
if [[ -d /usr/local/ec2/ ]]; then
 sudo mv /usr/local/ec2 /usr/local/ec2.old
fi
sudo mkdir /usr/local/ec2
sudo unzip ec2-api-tools.zip -d /usr/local/ec2
rm ec2-api-tools.zip

ec2dir=$(ls /usr/local/ec2)
export EC2_HOME=/usr/local/ec2/$ec2dir
echo 'export EC2_HOME='$EC2_HOME >> ~/.bashrc 
export PATH=$PATH:$EC2_HOME/bin
echo 'export PATH=$PATH:'$EC2_HOME'/bin' >> ~/.bashrc


