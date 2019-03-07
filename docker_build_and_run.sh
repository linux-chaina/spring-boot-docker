#!/usr/bin/env bash

echo " ====>>> try to docker build"
source docker_build.sh
echo " ====>>> docker build finished"

echo " ====>>> try to docker run"
source docker_run.sh $1
echo " ====>>> docker run finished"

# leave an empty line
