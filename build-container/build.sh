#!/bin/bash

docker build \
  -t griffinplus/toolchain-builder \
  --build-arg CTNG_VERSION=1.24.0 \
  .
