#!/usr/bin/env bash

containerId=`docker ps -a -q --filter name=mysql`

echo "$containerId"
