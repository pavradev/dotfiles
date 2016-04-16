# dev-env-setup
Setup development environment inside AWS instance

Run this
```bash
cd $HOME
curl -s -o setup.sh https://raw.githubusercontent.com/pavel-r/dev-env-setup/master/setup.sh
chmod +x setup.sh
./setup.sh
```
Or this if you have git
```bash
cd $HOME
git clone https://github.com/pavel-r/dev-env-setup.git
./dev-env-setup/setup.sh
```
Starting mondodb
```bash
docker run -p 27017:27017 --name mongo-swedic -d mongo
```
Starting cloud9 IDE as described [here](https://github.com/kdelfour/cloud9-docker)
```bash
docker run -it -d -p 80:80 -v /home/ubuntu/repositories/:/workspace/ kdelfour/cloud9-docker
```
## Known issues

* `npm install` can cause ENOM (end of memory) on machine with <2 GB RAM. Possible solution is to [create swap file](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04).

# Local machine setup
Install [AWS CLI](https://aws.amazon.com/cli/) and add aliases to `.bashrc`:
```bash
alias ec2-dns='aws ec2 describe-instances --region {region} --instance-ids {your-id} | grep -m 1 -o ec2-.*\.compute\.amazonaws\.com'
alias sshaws='ssh -i ~/.ssh/awstest.pem ubuntu@$(ec2-dns)'
alias ec2-stop='aws ec2 start-instances --instance-ids {your-id}'
alias ec2-start='aws ec2 stop-instances --instance-ids {your-id}'
```
These commands will halp to quickly start and stop your development environment in AWS

# Links
[startup-class](https://github.com/startup-class/setup)
