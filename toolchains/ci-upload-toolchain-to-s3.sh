#!/bin/bash

set -e

# This script packs a built toolchain and uploads it to the configured S3 server.
# The script must be run on an Azure Pipelines runner, as it refers to CI environment variables.

# The S3 server is specified by environment variables:
# - AWS_ENDPOINT: URL of the S3 endpoint
# - AWS_BUCKET_NAME: Name of the S3 bucket
# - AWS_ACCESS_KEY_ID: The Access Key Id of the S3 user account
# - AWS_SECRET_ACCESS_KEY: The Secret Access Key of the user account

# determine path to the script's directory
SCRIPT_PATH=`readlink -f "$0"`
SCRIPT_DIRECTORY=`dirname "$SCRIPT_PATH"`
GCC_VERSION="$1"
TOOLCHAIN_NAME="$2"

# prepare name of the package to create
# (the CI pipeline should only issue branch builds, not tag builds)
BRANCH_NAME="${BUILD_SOURCEBRANCHNAME:-unknown}"
PACKAGE_NAME="${TOOLCHAIN_NAME}"

# pack the toolchain into an archive and upload it to S3
pushd "${SCRIPT_DIRECTORY}/x-tools"
tar -czf "${PACKAGE_NAME}.tar.gz" "${TOOLCHAIN_NAME}/"
aws s3 cp "${PACKAGE_NAME}.tar.gz" "s3://${AWS_BUCKET_NAME}/${GCC_VERSION}/" --endpoint-url="${AWS_ENDPOINT}"
aws s3 cp "${TOOLCHAIN_NAME}/package.info" "s3://${AWS_BUCKET_NAME}/${GCC_VERSION}/${PACKAGE_NAME}.info" --endpoint-url="${AWS_ENDPOINT}"

# clean up
rm -f "${PACKAGE_NAME}.tar.gz"
