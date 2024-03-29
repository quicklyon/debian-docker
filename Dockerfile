FROM debian:bookworm-slim

LABEL maintainer="ysicing"

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/root" \
LANGUAGE="en_US.UTF-8" \
LANG="en_US.UTF-8" \
TERM="xterm" \
TZ=Asia/Shanghai

# copy sources
COPY sources.list /etc/apt/

RUN set -x \
    && rm -rf /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/backports.list \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https ca-certificates procps curl wget net-tools nano \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf \
        /tmp/* \
        /var/tmp/* \
        /var/lib/apt/lists/*
