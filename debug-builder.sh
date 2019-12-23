#!/bin/bash

# This script creates the build container using the shipped Dockerfile and enters
# an instance of it. The Dockerfile constructs the same docker image as used by
# the CI pipeline. Therefore it is useful when building a toolchain fails.

set -e

# determine path to the script's directory
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIRECTORY=$(dirname "$SCRIPT_PATH")

# build container with tools to build cross-compilers
docker build \
  -t griffinplus/toolchains/builder \
  "${SCRIPT_DIRECTORY}/build-container/"

# run and enter the build container
docker run \
  --rm \
  -it \
  --volume "${SCRIPT_DIRECTORY}:/repo" \
  griffinplus/toolchains/builder \
  /bin/bash
