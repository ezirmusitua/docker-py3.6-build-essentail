#!/usr/bin/env bash
sudo docker run --name $1 -v $2:$3 ubuntu:16.04 echo "Data-only container generated, use it with --volumes-from while running image"