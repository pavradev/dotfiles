FROM ubuntu:14.04 

# Proxy
ENV http_proxy=http://proxy.example.com:80
ENV https_proxy=https://proxy.example.com:80

RUN apt-get update -qq && \
 apt-get install -y git

RUN git clone https://github.com/pavel-r/dev-env-setup.git
RUN mkdir /repository

# Add user
RUN useradd --create-home --shell /bin/bash docker && \
  usermod -aG sudo docker && \
  chown -R docker:docker /repository
USER docker

RUN ./dev-env-setup/github-setup.sh --name=pavel-r --email=rabeckijps@gmail.com
WORKDIR /repository
