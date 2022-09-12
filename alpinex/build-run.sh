#!/bin/bash

path=./
imageName=alpinex
tag=3.9
containerName=alpinex

cd $path
docker build -t $imageName:$tag .
# 删除上次容器
[ "$(docker ps -a | grep $containerName)" ] && docker rm -f $containerName
# 删除多余的<NONE>镜像
NONE_IMAGES_KEY=$(docker images -f "dangling=true" -q)
[ "$NONE_IMAGES_KEY" ] && docker rmi -f $NONE_IMAGES_KEY

# 启动，bash访问
docker run --name $containerName -itd $imageName:$tag && docker exec -it $containerName bash

