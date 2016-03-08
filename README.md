# dev-env-setup
Setup development environment

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
## Known issues

* `npm install` can cause ENOM (end of memory) on machine with <2 GB RAM. Possible solution is to [create swap file](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04).
