FROM ubuntu:18.04

ARG CMAKE_VERSION=3.16.2

RUN \
  # install packages from Ubuntu
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
  rm -rf /var/lib/apt/lists/* && \
  # install cmake
  cd /tmp && \
  curl --location --output cmake.tar.gz https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION-Linux-x86_64.tar.gz && \
  tar -xvzf cmake.tar.gz -C /usr/local/ --strip-components=1
