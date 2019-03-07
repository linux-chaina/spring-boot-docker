#!/bin/bash

# 指定环境, 默认default
SPRING_PROFILES_ACTIVE=${1:-"default"}

# 常量定义
IMAGE=docker-server:dev
CONTAINER_NAME=docker-server
PORT=8080
DEBUG_PORT=5005
JAVA_OPTS='-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005'

echo "try to run a container from image: [$IMAGE]"

# 查找正在运行当前镜像的容器并停止和移除该容器
exists_container=`docker ps -a -q --filter name=${CONTAINER_NAME}`

echo "=====>> find all containers:"
docker ps -a

if [[ ! ${exists_container} || ${exists_container} == '' ]]; then
    echo "there has no container name like: $CONTAINER_NAME"
else
    echo "find exists container = [$exists_container], try to stop and remove it."
    echo "=====>> stop it `docker stop ${exists_container}`"
    echo "=====>> remove it `docker rm -f ${exists_container}`"
    echo "$exists_container has been stopped and removed succeed."
fi

echo "=====>> try to start a new container from image = [$IMAGE]"

docker run -p ${PORT}:${PORT} -p ${DEBUG_PORT}:${DEBUG_PORT} -i -t -e "SPRING_PROFILES_ACTIVE=$SPRING_PROFILES_ACTIVE" -e "JAVA_OPTS=$JAVA_OPTS" -d --name=${CONTAINER_NAME} ${IMAGE}

new_container=`docker ps -a -q --filter name=${CONTAINER_NAME}`
echo "docker start succeed, new CONTAINER ID = [$new_container]"

# leave an empty line
