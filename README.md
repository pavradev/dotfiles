# Remote setup
Setup development environment inside AWS instance. Run the following scripts inside your EC2 instance:
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
alias ec2-stop='aws ec2 start-instances --region {region} --instance-ids {your-id}'
alias ec2-start='aws ec2 stop-instances --region {region} --instance-ids {your-id}'
# gives information about you ec2 instance
alias ec2-describe='aws ec2 describe-instances --region {region} --instance-ids {your-id}'
# prints ec2 instance public dns
alias ec2-dns='ec2-describe | grep -m 1 -o ec2-.*\.compute\.amazonaws\.com'
# ssh into your ec2 machine
alias sshaws='ssh -i ~/.ssh/{your-key}.pem ubuntu@$(ec2-dns)'
```
These commands will help to quickly start and stop your development environment in AWS

# Links
* [startup-class](https://github.com/startup-class/setup)
