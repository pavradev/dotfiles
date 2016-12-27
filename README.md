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
Starting cloud9 IDE as described [here](https://github.com/kdelfour/cloud9-docker)
```bash
docker run -it -d -p 80:80 -v /home/ubuntu/repositories/:/workspace/ --name cloud9 kdelfour/cloud9-docker
```
## Known issues

* `npm install` can cause ENOM (end of memory) on machine with <2 GB RAM. Possible solution is to [create swap file](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04).

# Links
* [startup-class](https://github.com/startup-class/setup)
