#!/bin/sh

set -e

#
# This script takes the built toolchains and packs them one by one into docker
# images deriving from the base toolchain image. These images can be used to
# build other projects targeting the specific platform. The script must be run
# on a Gitlab CI runner only, as it refers to CI environment variables.
#

# determine path to the script's directory
SCRIPT_PATH=`readlink -f "$0"`
SCRIPT_DIRECTORY=`dirname "${SCRIPT_PATH}"`

echo
echo "--------------------------------------------------------------------------------"
echo "Building toolchain base image docker image and deploying to"
echo "${CI_REGISTRY_IMAGE}/base:${CI_COMMIT_REF_NAME}"
echo "--------------------------------------------------------------------------------"
echo

kaniko-build \
  --context "${CI_PROJECT_DIR}/toolchain-base-container" \
  --dockerfile Dockerfile \
  --destination ${CI_REGISTRY_IMAGE}/base:${CI_COMMIT_REF_NAME} \
  --single-snapshot

find "$SCRIPT_DIRECTORY/x-tools" -maxdepth 1 -mindepth 1 -type d | while IFS= read -r TOOLCHAIN_PATH; do

    TOOLCHAIN_NAME=${TOOLCHAIN_PATH##*/}
    REGISTRY_IMAGE=${CI_REGISTRY_IMAGE}/${TOOLCHAIN_NAME}:${CI_COMMIT_REF_NAME}

    echo
    echo "--------------------------------------------------------------------------------"
    echo "Building and deploying toolchain '${TOOLCHAIN_NAME}' in docker image to"
    echo "${REGISTRY_IMAGE}"
    echo "--------------------------------------------------------------------------------"
    echo

    echo "Preparing build context..."
    rm -rf /build-context
    mkdir -p "/build-context/files/usr/local/x-tools"
    cp -R "${SCRIPT_DIRECTORY}/x-tools/${TOOLCHAIN_NAME}" "/build-context/files/usr/local/x-tools"

    echo
    echo "Preparing Dockerfile..."
    cat > "/build-context/Dockerfile" <<EOL
FROM ${CI_REGISTRY_IMAGE}/base:${CI_COMMIT_REF_NAME}
ENV PATH "/usr/local/x-tools/${TOOLCHAIN_NAME}/bin:\${PATH}"
COPY files /
EOL

    echo
    echo "Building docker image..."
    kaniko-build \
      --context /build-context \
      --dockerfile Dockerfile \
      --destination ${CI_REGISTRY_IMAGE}/${TOOLCHAIN_NAME}:${CI_COMMIT_REF_NAME} \
      --single-snapshot

done
