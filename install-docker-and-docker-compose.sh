#!/bin/bash

echo '========== Cleanup environment & install docker and docker compose =========='

echo "Start to clean the environment from docker"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y
echo "Finished the cleaning from docker"

echo "Start to install docker"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
apt-cache -y madison docker-ce
when running docker
sudo usermod -aG docker $(whoami)
echo "Finished the installation of docker"

echo "Start to install docker compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Finished the installation of docker compose"

echo '============================ Finished ================================'