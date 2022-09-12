#!/bin/bash

# 基础镜像
FROM alpinex-jdk8:alpine-3.9_glibc-2.29-sshd-rsh

# 维护人信息
MAINTAINER iSwfe

# 上传文件
ADD slog-app.sh .
ADD demo.jar app.jar

# 配置
RUN echo -e "bash slog-app.sh\n" >> /root/.bashrc

# 启动
EXPOSE 22
ENTRYPOINT /usr/sbin/sshd && script -qfc "java -jar app.jar" log_app.log

