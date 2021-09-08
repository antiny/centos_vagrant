#!/bin/bash

sudo yum update -y

echo "installing docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
sudo groupadd docker
sudo usermod -aG docker $USER
sh newgrp docker

sudo systemctl enable docker
sudo systemctl start docker

# dev tools
sudo yum groupinstall -y "Development Tools"
sudo yum install -y zlib-devel openssl-devel ncurses-devel libffi-devel sqlite-devel.x86_64 readline-devel.x86_64 bzip2-devel.x86_64
git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git
sh ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer
echo 'export PATH="/home/vagrant/.ebcli-virtual-env/executables:$PATH"' >> ~/.bash_profile && source ~/.bash_profile
echo 'export PATH=/home/vagrant/.pyenv/versions/3.7.2/bin:$PATH' >> /home/vagrant/.bash_profile && source /home/vagrant/.bash_profile
