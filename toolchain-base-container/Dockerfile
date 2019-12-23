FROM ubuntu:18.04

RUN \
  apt-get update -y && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    make \
    nano \
    patch \
    wget \
    zip && \
  apt-get -y autoremove && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
