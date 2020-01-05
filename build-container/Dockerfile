FROM ubuntu:18.04

ARG CTNG_VERSION

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
    git \
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

RUN /bin/bash -c \
    ' \
    set -e; \
    mkdir -p /toolchain; \
    pushd /toolchain > /dev/null; \
    CTNG_REPO_URL="https://github.com/crosstool-ng/crosstool-ng"; \
    if [[ "$CTNG_VERSION" =~ ^[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}$ ]]; then \
      # release version (format: 'x.y.z')
      GIT_TAG="crosstool-ng-$CTNG_VERSION"; \
      echo "Trying to download git tag \"${GIT_TAG}\"..."; \
      git clone --depth=1 --branch ${GIT_TAG} $CTNG_REPO_URL sources; \
    elif [[ "$CTNG_VERSION" =~ ^[0-9a-fA-F]{40}$ ]]; then \
      # specific commit hash
      echo "Trying to download specific commit \"$CTNG_VERSION\"..."; \
      mkdir sources; \
      pushd sources > /dev/null; \
      git init; \
      git remote add origin $CTNG_REPO_URL; \
      git fetch origin $CTNG_VERSION; \
      git reset --hard FETCH_HEAD; \
      popd > /dev/null; \
    else \
      # explicit git branch/tag
      echo "Trying to download git branch/tag \"$CTNG_VERSION\"..."; \
      git clone --depth=1 --branch $CTNG_VERSION $CTNG_REPO_URL sources; \
    fi; \
    cd sources; \
    ./bootstrap; \
    ./configure --prefix=/usr/local; \
    make; \
    make install; \
    popd > /dev/null; \
    rm -rf /toolchain \
    '
