#!/bin/bash
# remove unused containers & images 
docker rm $(docker ps -q -f 'status=exited')
docker rmi $(docker images -q -f "dangling=true")
#https://gist.github.com/listochkin/10973974
docker volume rm $(docker volume ls -qf dangling=true)
