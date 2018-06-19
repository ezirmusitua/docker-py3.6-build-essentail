#!/usr/bin/env bash
# check is production config exists in configs
dockerfile_prod=configs/docker-compose.prod.yml

if [ ! -f ${compose_prod} ] 
then
    echo "Start configuration"
    python3 config.py
    echo "configuration generated, start deploying ... "
fi

echo "First, remove old file ... "
if [ -d shadowsocksR ]
then
    sudo rm -rf shadowsocksR
fi
if [ -f shadowsocksR.tar.gz ]
then
    sudo rm shadowsocksR.tar.gz
fi

echo "Secondly, prepare files ... "
mkdir shadowsocksR
cp Dockerfile.prod shadowsocksR/Dockerfile

echo "Create tar.gz file ... "
tar -zcvf shadowsocksR.tar.gz shadowsocksR

# remove exists
ssh vps-jp-1c1g "cd ~/projects && rm -rf shadowsocksR && rm shadowsocksR.tar.gz"
# scp tar file to deploy server
scp shadowsocksR.tar.gz vps-jp-1c1g:~/projects/
# extract
ssh vps-jp-1c1g "cd ~/projects && tar -xzf shadowsocksR.tar.gz && rm shadowsocksR.tar.gz"
# stop running containers
ssh vps-jp-1c1g "docker stop ssr:latest"
# remove containers
ssh vps-jp-1c1g "docker rm ssr:latest"
# remove images
ssh vps-jp-1c1g "docker rmi ssr:latest"
# keep or remove volume if necessary
# rebuild and up docker containers
ssh vps-jp-1c1g "cd ~/projects/shadowsocksR && docker build -t ssr:latest ."
ssh vps-jp-1c1g "cd ~/projects/shadowsocksR && docker run ssr:latest > ssr.log 2>&1 &"

echo "Doing clean work ... "
sudo rm -rf shadowsocksR
sudo rm shadowsocksR.tar.gz