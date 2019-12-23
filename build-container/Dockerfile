FROM ubuntu:18.04

ENV CTNG_VERSION=1.24.0

RUN \
  apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    awscli \
    bison \
    ca-certificates \
    file \
    flex \
    gawk \
    gcc \
    g++ \
    gnupg2 \
    help2man \
    libncurses5-dev \
    libtool-bin \
    make \
    nano \
    patch \
    texinfo \
    wget \
    xz-utils \
    unzip && \
  apt-get -y autoremove && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir -p /toolchain && \
  cd /toolchain && \
  # gpg --keyserver http://pgp.surfnet.nl --recv-keys 11D618A4 && \
  wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-$CTNG_VERSION.tar.xz && \
  wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-$CTNG_VERSION.tar.xz.sig && \
  ls -al && \
  # gpg --verify crosstool-ng-$CTNG_VERSION.tar.xz.sig && \
  tar -xvf crosstool-ng-$CTNG_VERSION.tar.xz && \
  cd crosstool-ng-$CTNG_VERSION && \
  ./configure --prefix=/usr/local && \
  make && \
  make install && \
  rm -rf /toolchain
