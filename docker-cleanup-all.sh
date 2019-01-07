#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q) -f 
# Delete all images
docker rmi $(docker images -q) -f

# remove unused containers & images 
docker rm $(docker ps -q -f 'status=exited')
docker rmi $(docker images -q -f "dangling=true")
#https://gist.github.com/listochkin/10973974
docker volume rm $(docker volume ls -qf dangling=true)

# delete all networks
docker network prune -f
