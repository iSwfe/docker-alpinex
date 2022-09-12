#!/bin/bash

# 基础镜像
FROM alpinex-jdk8:alpine-3.9_glibc-2.29

# 维护人信息
LABEL maintainer iSwfe

# 配置参数

# 安装openssh-server，配置sshd服务
RUN apk add openssh-server
RUN echo "root:123" | chpasswd
#RUN echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/local
#RUN ssh-keygen -A

# 固定主机密钥
COPY ssh/* /etc/ssh/

# 配置可信机器的公钥，方便登录
COPY authorized_keys /root/.ssh/

# 启动sshd
EXPOSE 22
CMD ["sshd", "-v"]

