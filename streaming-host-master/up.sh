#!/bin/sh
docker pull docker:1.13.0-dind
docker-compose up -d
git clone https://github.com/direnv/direnv
cd direnv
sudo make install
cd streaming_host
direnv allow
docker-compose up -d
cd ../