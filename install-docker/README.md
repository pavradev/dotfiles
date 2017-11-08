#### 1. Add key
`sudo -E apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D`
#### 2. Add repository
`sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list'`
#### 3. Update Ubuntu Packages Cache
`sudo apt-get update`
#### 4. Install Docker Engine
`sudo apt-get install -y docker-engine=1.13.0-0~ubunty-xenial`
#### 5. Freeze version of Docker so updates doesn't break anything 
`sudo apt-mark hold docker-engine`
#### 6. change DOCKER_OPTS to accept our local
`registry echo 'DOCKER_OPTS="--insecure-registry <your registry>" '| sudo tee -a /etc/default/docker`
#### 7. Be able to run docker without sudo (usually needed for maven-docker-plugin)
`sudo usermod -aG docker $USER`
#### 8. Create dir for conf
`sudo mkdir -p /etc/systemd/system/docker.service.d/`
#### 9. Edit or create
/etc/systemd/system/docker.service.d/docker.conf
```
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H fd://
$DOCKER_OPTS
EnvironmentFile=-/etc/default/docker
```
#### 10. Restart docker
`sudo systemctl daemon-reload`
`sudo systemctl restart docker`
#### 11. Check if --insecure-registry is after
-H fd://systemctl status docker
#### 12. Be able to run docker without sudo
(needed for maven-docker-plugin)
`sudo usermod -aG docker $USER`
#### 13. Log out and log in again


####Show version for client and server
`docker version`
####Pull ubuntu form Official Public dockerhub
`docker pull ubuntu:14.04`
####Try our registry
`docker pull`