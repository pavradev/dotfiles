# Remote setup
Setup development environment inside AWS instance. Run the following scripts inside your EC2 instance:
```bash
cd $HOME
wget https://raw.githubusercontent.com/pavel-r/dev-env-setup/master/setup.sh
chmod +x setup.sh
./setup.sh
```
Or this if you have git
```bash
cd $HOME
git clone https://github.com/pavel-r/dev-env-setup.git
./dev-env-setup/setup.sh
```
For node applications:
```bash
docker run -it --rm -p 9000:9000 -e "NODE_ENV=docker" -v $PWD:/data digitallyseamless/nodejs-bower-grunt
```
Starting mondodb
```bash
docker run -p 27017:27017 --name mongo-swedic -d mongo
```
Starting cloud9 IDE as described [here](https://github.com/kdelfour/cloud9-docker)
```bash
docker run -it -d -p 80:80 -v /home/ubuntu/repositories/:/workspace/ --name cloud9 kdelfour/cloud9-docker
```
## Known issues

* `npm install` can cause ENOM (end of memory) on machine with <2 GB RAM. Possible solution is to [create swap file](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04).

# Local machine setup
Create `credentials` file and save it under `~/.aws/credentials`.
Install [AWS CLI](https://aws.amazon.com/cli/) and add aliases to `.bash_aliases`:
```bash
alias ec2-stop='aws ec2 start-instances --region eu-west-1 --instance-ids {your-id}'
alias ec2-start='aws ec2 stop-instances --region eu-west-1 --instance-ids {your-id}'
# gives information about you ec2 instance
alias ec2-describe='aws ec2 describe-instances --region eu-west-1 --instance-ids {your-id}'
# prints ec2 instance public dns
alias ec2-dns='echo "$(ec2-describe)" | grep -m 1 -o ec2-.*\.compute\.amazonaws\.com'
# ssh into your ec2 machine
alias sshaws='ssh -i ~/.ssh/{your-key}.pem ubuntu@$(ec2-dns)'
```

Alternatively, you can run [docker-aws-cli](https://hub.docker.com/r/pebbletech/docker-aws-cli/) withou installing AWS CLI. Add an extra alias in front of others then:
```bash
alias aws='docker run --rm -v ${HOME}/.aws/credentials:/root/.aws/credentials pebbletech/docker-aws-cli aws'
```
or if you use proxy
```bash
alias aws='docker run --rm -e "http_proxy={proxy_server}" -v ${HOME}/.aws/credentials:/root/.aws/credentials pebbletech/docker-aws-cli aws'
```
# Links
* [startup-class](https://github.com/startup-class/setup)
