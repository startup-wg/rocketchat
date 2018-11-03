#!/bin/bash

export LC_ALL=en_US

git_update=`git pull origin master --quiet`
rocket_update=`docker pull rocketchat/rocket.chat:latest`

if [[ $git_update =~ "Already" || $rocket_update =~ "Image is up to date" ]]; then
  echo "already up to date"
else
  echo "restarting server"
  docker-compose up -d
fi
