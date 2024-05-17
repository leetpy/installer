#!/bin/bash

# 使用编译时间作为版本号
version=$(date +"%Y%m%d%H%M%S")

app_name="centos"

/makeself.sh ${app_name} ${app_name}-installer-${version}.run "${app_name} installer" ./start.sh