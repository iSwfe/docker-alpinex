#!/bin/bash

# 使用Alpine官方作为基础镜像
FROM alpine:3.9
#FROM frolvlad/alpine-glibc:alpine-3.9

# 维护人信息
LABEL maintainer iSwfe

# 配置参数
ARG APK_MIRROR_HOST="mirrors.tuna.tsinghua.edu.cn" \
    TZ="Asia/Shanghai"

# apk换源
RUN sed -i 's/dl-cdn.alpinelinux.org/'${APK_MIRROR_HOST}'/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade

# 安装bash，bash配置
RUN apk add --no-cache \
    bash \
    bash-doc \
    bash-completion \
    && echo -e "export PS1='[\u@\h \w]\$ '\nalias ll='ls -lh'\n" >> /root/.bashrc \
    && echo -e "\nsource /root/.bashrc\n" >> /etc/profile \
    && sed -i 's/\/ash/\/bash/g' /etc/passwd
SHELL ["bash", "-c"]

# 配置时区
RUN apk -U add tzdata \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && apk del tzdata
ENV TZ=${TZ}

# 添加常用工具集
RUN apk add --no-cache \
    curl \
    less \
    util-linux \
    busybox-extras
# 安装lrzsz
WORKDIR /tmp/
COPY ["rz", "sz", "/usr/local/bin/"]
RUN rm -rf *

# 基础配置
WORKDIR /root/

