#!/bin/bash

# This script builds the specified toolchain.

set -e

# Concurrency of the build process
CONCURRENCY_LEVEL=${CONCURRENCY_LEVEL:-1}

# determine path to the script's directory
SCRIPT_PATH=`readlink -f "$0"`
SCRIPT_DIRECTORY=`dirname "$SCRIPT_PATH"`

# build specified toolchain configuration
GCC_VERSION="$1"
TOOLCHAIN_NAME="$2"
TOOLCHAIN_CONFIG_PATH="${SCRIPT_DIRECTORY}/configs/${GCC_VERSION}/${TOOLCHAIN_NAME}.config"
cd "${SCRIPT_DIRECTORY}"
cp "${TOOLCHAIN_CONFIG_PATH}" .config
ct-ng oldconfig
ct-ng upgradeconfig
ct-ng build.${CONCURRENCY_LEVEL}

# create toolchain version information and package information file
CTNG_CONFIG=$(ct-ng show-config)
pushd "${SCRIPT_DIRECTORY}/x-tools/${TOOLCHAIN_NAME}"
chmod u+w .
echo "${CTNG_CONFIG}" > toolchain.info
cat > package.info <<EOT
Cross-Toolchain built by GriffinPlus using crosstool-NG
https://github.com/GriffinPlus/toolchains
--------------------------------------------------------------------------------
Host:    x86_64-pc-linux-gnu
Target:  ${TOOLCHAIN_NAME}
--------------------------------------------------------------------------------
Build Date: $(date)
Branch/Tag: ${BUILD_SOURCEBRANCHNAME}
Commit:     ${BUILD_SOURCEVERSION}
--------------------------------------------------------------------------------
>>> Crosstool-NG Configuration (ct-ng show-config)

${CTNG_CONFIG}
--------------------------------------------------------------------------------
>>> Crosstool-NG Version (ct-ng version)

$(ct-ng version)
--------------------------------------------------------------------------------
EOT
chmod u-w .
popd
