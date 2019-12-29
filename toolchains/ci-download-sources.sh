#!/bin/bash

# This script iterates through the shipped toolchain configurations and downloads
# all tarballs that are needed to build the toolchains. As this is done only once
# in the CI pipeline, network traffic and CI time is reduced.

set -e

# determine path to the script's directory
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIRECTORY=$(dirname "$SCRIPT_PATH")

# the first argument is the name/version of the compiler in the toolchain
COMPILER="$1"

# download tarballs for all specified targets to avoid that sources
# are downloaded repeatedly (reduces network traffic and CI time)
pushd "${SCRIPT_DIRECTORY}"
for filename in "${SCRIPT_DIRECTORY}/configs/${COMPILER}/"*".config"
do
    cp "${filename}" "${SCRIPT_DIRECTORY}/.config"

    # let crosstool-ng download everything needed to build the toolchains
    ct-ng oldconfig
    ct-ng source
done
