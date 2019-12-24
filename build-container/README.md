# Crosstool-NG v1.24 for building cross-toolchains.

[![Build Status](https://dev.azure.com/griffinplus/Cross-Toolchains/_apis/build/status/20?branchName=master)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build/latest?definitionId=20&branchName=master)
[![Docker Pulls](https://img.shields.io/docker/pulls/griffinplus/toolchain-builder.svg)](https://hub.docker.com/r/griffinplus/toolchain-builder/)

This docker image provides an environment for building cross-toolchains with [Crosstool-NG](https://crosstool-ng.github.io/).
It is basically an Ubuntu 18.04 LTS image with all the development packages needed by Crosstool-NG.
The image is used to build a set of selected toolchains that are available [here](https://github.com/GriffinPlus/toolchains).

## License

The blueprint for this docker image is under the [MIT license](https://github.com/GriffinPlus/toolchains/blob/master/LICENSE),
but as for almost all Docker images the built image contains other software that is subject to different open-source licenses.
By using the image you agree to comply with the licenses of all software within the image.
