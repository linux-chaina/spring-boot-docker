#!/bin/bash

# 常量, 这些常量可以作为参数形式传进来
MODULE_DIR_NAME=docker-server                                   # 运行server的module目录, 即启动spring的目录, 发布时请修改为自己的server目录
APP_TARGET_DIR=./${MODULE_DIR_NAME}/target/                     # module编译打包之后的目录
APP_DOCKER_META=./APP-META/docker                               # docker配置目录
APP_DOCKER_FILE=./APP-META/docker/Dockerfile                    # 将Dockerfile复制到的需要执行docker build的目录
DOCKER_IMAGE_TAG=docker-server:dev                              # docker镜像名称

# 清空target
mvn clean -U -Dmaven.test.skip

# install依赖包, 如果有子module且没有将子module deploy到mvn仓库, 所以需要单独install
# mvn clean -U -Dmaven.test.skip install

# 打包app jar
mvn package -am -pl ${MODULE_DIR_NAME}/ -Dmaven.test.skip

# 复制Dockerfile, 进入target目录
cp ${APP_DOCKER_FILE} ${APP_TARGET_DIR}

echo "====> go to app target dir = $APP_TARGET_DIR"

cd ${APP_TARGET_DIR}

echo "====> current dir: `pwd`"
echo "====> current dir files: `ll`"
echo "====> now try to build docker image = $DOCKER_IMAGE_TAG"

# 进入打包docker镜像
docker build -t ${DOCKER_IMAGE_TAG} .

echo " ---> image build succeed, image info:"
docker images ${DOCKER_IMAGE_TAG}

# 删除无效文件
rm -rf Dockerfile
echo " ---> remove useless file: $DOCKER_IMAGE_TAG/Dockerfile"

# 回到原目录, 如果后续需要执行docker_run.sh
cd ../../
echo " ---> back to parent dir: `pwd`"

# leave an empty line
