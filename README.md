# Installer

## 介绍

用于离线安装常见的依赖包，目前仅仅支持 amd64 平台，对于 arm 的信创服务器未做适配。

## Build

```bash
# 构建可执行 run 包
./build.sh

# 将当前目录下的 xxx.run 文件拷贝到需目标机器执行即可
```

## 使用说明

### 执行安装包（只需要第一次执行一次）

```bash
# 需要使用 root 用户运行
./centos-installer-.*.run

source /root/.bashrc
```

### 安装需要的 rpm 包

```bash
# rpm 包安装，例如安装 redis
xyum install redis
```

## 添加安装包

### CentOS

```
# 1. 下载需要的 rpm 包文件，将 文件拷贝到 centos/rpms/ 目录即可

# 2. 下载方式，这里以下载 mariadb 以及其依赖包为例
# 最好找一台没安装过什么包的 CentOS 环境，如果你本地依赖包已经安装过，这里就不会下载依赖包
yumdownloader --destdir=. --resolve mariadb
```

## 支持的操作系统

- CentOS 7.9 (镜像下载地址： https://mirrors.aliyun.com/centos/7.9.2009/isos/x86_64/)

### 支持的组建

1.  Redis

    - 3.2.12

2.  Mariadb
    - 5.5.68
3.  MongoDB
4.  RabbitMQ
    - 3.3.5-34
5.  Elasticsearch
    - 7.17.21
    - 8.13.4
6.  Postgre
7.  Docker
    - 1.13.1

### 支持的基础命令

1.  telnet
2.  lsof
3.  netstat
4.  wget
5.  vim
6.  net-tools
