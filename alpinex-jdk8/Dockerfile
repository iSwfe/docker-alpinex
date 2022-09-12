#!/bin/bash

# 基础镜像
FROM alpinex:3.9-glibc

# 维护人信息
LABEL maintainer iSwfe

# 配置参数
ARG JDK8_TAR_URL="http://mirrors.huaweicloud.com/java/jdk/8u192-b12/jdk-8u192-linux-x64.tar.gz"

# 工作目录
WORKDIR /tmp/

# 配置JDK8环境
ENV JAVA_HOME=/usr/local/jdk1.8.0
ENV JRE_HOME=$JAVA_HOME/jre
ENV CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
ENV PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

# 下载JDK8
#COPY jdk*.tar.gz jdk8.tar.gz
RUN wget -q ${JDK8_TAR_URL} -O jdk8.tar.gz \
    && tar -zxf jdk8.tar.gz \
    && mv jdk1.8.0* /usr/local/jdk1.8.0 \
    && rm -rf jdk8.tar.gz \
    && rm -rf "$JAVA_HOME/"*src.zip \
        "$JAVA_HOME/lib/missioncontrol" \
        "$JAVA_HOME/lib/visualvm" \
        "$JAVA_HOME/lib/"*javafx* \
        "$JAVA_HOME/jre/lib/plugin.jar" \
        "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
        "$JAVA_HOME/jre/bin/javaws" \
        "$JAVA_HOME/jre/lib/javaws.jar" \
        "$JAVA_HOME/jre/lib/desktop" \
        "$JAVA_HOME/jre/plugin" \
        "$JAVA_HOME/jre/lib/"deploy* \
        "$JAVA_HOME/jre/lib/"*javafx* \
        "$JAVA_HOME/jre/lib/"*jfx* \
        "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
        "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
        "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
        "$JAVA_HOME/jre/lib/amd64/libglass.so" \
        "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
        "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
        "$JAVA_HOME/jre/lib/amd64/"libjfx*.so \
        "$JAVA_HOME/jre/bin/jjs" \
        "$JAVA_HOME/jre/bin/keytool" \
        "$JAVA_HOME/jre/bin/orbd" \
        "$JAVA_HOME/jre/bin/pack200" \
        "$JAVA_HOME/jre/bin/policytool" \
        "$JAVA_HOME/jre/bin/rmid" \
        "$JAVA_HOME/jre/bin/rmiregistry" \
        "$JAVA_HOME/jre/bin/servertool" \
        "$JAVA_HOME/jre/bin/tnameserv" \
        "$JAVA_HOME/jre/bin/unpack200" \
        "$JAVA_HOME/jre/lib/ext/nashorn.jar" \
        "$JAVA_HOME/jre/lib/jfr.jar" \
        "$JAVA_HOME/jre/lib/jfr" \
        "$JAVA_HOME/jre/lib/oblique-fonts"

# 工作目录
WORKDIR /root/runtime/backend/
RUN echo -e "cd /root/runtime/backend/\n" >> /root/.bashrc
CMD ["java", "-version"]

