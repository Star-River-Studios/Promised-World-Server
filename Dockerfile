# 基于Debian 13（Trixie）作为基础镜像
FROM debian:trixie

# 镜像基本信息
LABEL org.opencontainers.image.title="Promised World Server"
LABEL org.opencontainers.image.description="Promised World Server Docker Image"
LABEL org.opencontainers.image.authors="ManyStars"
LABEL org.opencontainers.image.vendor="Star River Studios"
LABEL org.opencontainers.image.source="https://github.com/Star-River-Studios/Promised-World-Server"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.version="1.0.0+pw.20251225"

# 安装系统组件
ENV TERM="xterm-256color"
ENV DEBIAN_FRONTEND="noninteractive"
RUN sed -i 's|http://deb.debian.org|http://mirrors.ustc.edu.cn|g' /etc/apt/sources.list.d/debian.sources \
    && sed -i 's|http://security.debian.org|http://mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list.d/debian.sources \
    && apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends gnupg ca-certificates curl locales apt-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置语言和时区
ENV TZ="Asia/Shanghai"
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# 安装程序组件
ENV JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=false -Djava.net.preferIPv6Addresses=true"
RUN sed -i 's|http://mirrors.ustc.edu.cn|https://mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources \
    && sed -i 's|http://mirrors.ustc.edu.cn/debian-security|https://mirrors.aliyun.com/debian-security|g' /etc/apt/sources.list.d/debian.sources \
    && curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" > /etc/apt/sources.list.d/zulu.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends zulu21-jre \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*