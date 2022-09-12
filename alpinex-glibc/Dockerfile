#!/bin/bash

# 基础镜像
FROM alpinex:3.9

# 维护人信息
LABEL maintainer iSwfe

# 配置参数

# 工作目录
WORKDIR /tmp/

# 安装glibc和i18n依赖环境
# glibc下载地址：https://github.com/sgerrand/alpine-pkg-glibc/releases
COPY *.apk ./
RUN wget -q https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -O /etc/apk/keys/sgerrand.rsa.pub \
    && apk add *.apk \
    && echo -e "en_US\nzh_CN\nzh_HK\nzh_SG\nzh_TW\nzu_ZA" > locale.md \
    && cat locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8 \
    && rm -rf * /var/cache/apk/*

# 指定编码
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8

WORKDIR /root/

