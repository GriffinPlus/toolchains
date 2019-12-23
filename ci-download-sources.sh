#!/bin/bash

# This script iterates through the shipped toolchain configurations and downloads
# all tarballs that are needed to build the toolchains. As this is done only once
# in the CI pipeline, network traffic and CI time is reduced. The script must be
# run on a Gitlab CI runner only, as it refers to CI environment variables.

set -e

# determine path to the script's directory
SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIRECTORY=$(dirname "$SCRIPT_PATH")

# create directory where crosstool-ng keeps downloaded tarballs
mkdir -p "${SCRIPT_DIRECTORY}/.work/src"

# download tarballs for all specified targets to avoid that sources
# are downloaded repeatedly (reduces network traffic and CI time)
pushd "${SCRIPT_DIRECTORY}"
for filename in "${SCRIPT_DIRECTORY}/toolchains/"*".config"
do
    cp "${filename}" "${SCRIPT_DIRECTORY}/.config"

    # let crosstool-ng download everything needed to build the toolchains
    ct-ng oldconfig
    ct-ng source
done
