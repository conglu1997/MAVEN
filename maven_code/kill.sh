#!/bin/bash
echo "Killing all docker containers with a name  matching ${USER}_maven_GPU_*"
docker rm $(docker stop $(docker ps -a -q --filter name=${USER}_maven_GPU_ --format="{{.ID}}"))