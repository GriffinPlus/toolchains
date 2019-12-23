#!/bin/bash

set -e

# This script triggers building the specified toolchain, packs the result and
# uploads it to the configured S3 server. The script must be run on a Gitlab CI
# runner only, as it refers to CI environment variables.

# The S3 server is specified by environment variables:
# - AWS_ENDPOINT: URL of the S3 endpoint
# - AWS_BUCKET_NAME: Name of the S3 bucket
# - AWS_ACCESS_KEY_ID: The Access Key Id of the S3 user account
# - AWS_SECRET_ACCESS_KEY: The Secret Access Key of the user account

# Concurrency of the build process
CONCURRENCY_LEVEL=${CONCURRENCY_LEVEL:-1}

# determine path to the script's directory
SCRIPT_PATH=`readlink -f "$0"`
SCRIPT_DIRECTORY=`dirname "$SCRIPT_PATH"`

# build specified toolchain configuration
TOOLCHAIN_NAME="$1"
TOOLCHAIN_CONFIG_PATH="${SCRIPT_DIRECTORY}/toolchains/${TOOLCHAIN_NAME}.config"
cd "${SCRIPT_DIRECTORY}"
cp "${TOOLCHAIN_CONFIG_PATH}" .config
ct-ng oldconfig
ct-ng build.${CONCURRENCY_LEVEL}

# prepare name of the package to create
if [ -z "${CI_COMMIT_TAG}" ]; then
    # tag build
    PACKAGE_NAME=${TOOLCHAIN_NAME}-${CI_COMMIT_REF_NAME:-unknown}
else
    # branch build
    PACKAGE_NAME=${TOOLCHAIN_NAME}-branch-${CI_COMMIT_REF_NAME:-unknown}
fi

# pack the toolchain into an archive and upload it to S3
cd "${SCRIPT_DIRECTORY}/x-tools"
tar -czf ${PACKAGE_NAME}.tar.gz ${TOOLCHAIN_NAME}/
aws s3 cp ${PACKAGE_NAME}.tar.gz s3://${AWS_BUCKET_NAME}/ --endpoint-url=${AWS_ENDPOINT}

# upload info file with additional information about the origin of the package
cat > ${PACKAGE_NAME}.info <<EOL
Built:      $(date)
Branch/Tag: ${CI_COMMIT_REF_NAME}
Commit:     ${CI_COMMIT_SHA}
EOL
aws s3 cp ${PACKAGE_NAME}.info s3://${AWS_BUCKET_NAME}/ --endpoint-url=${AWS_ENDPOINT}

# clean up
rm -f ${PACKAGE_NAME}.tar.gz
rm -f ${PACKAGE_NAME}.info
