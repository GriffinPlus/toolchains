#!/bin/bash

# This script loads the specified toolchain configuration, pops up the menu-driven
# configuration and saves the configuration after editing.

set -e

# determine path to the script's directory
SCRIPT_PATH=`readlink -f "$0"`
SCRIPT_DIRECTORY=`dirname "$SCRIPT_PATH"`

# create directory to work in
WORKING_DIRECTORY=`pwd`

# copy specified toolchain configuration to scratch directory, start editing and
# copy the modified configuration back
TOOLCHAIN_CONFIG_PATH=`readlink -f "$1"`
cp "${TOOLCHAIN_CONFIG_PATH}" .config
ct-ng oldconfig
ct-ng upgradeconfig
ct-ng menuconfig
cp .config "${TOOLCHAIN_CONFIG_PATH}"

echo "Finished editing ${TOOLCHAIN_CONFIG_PATH}."
