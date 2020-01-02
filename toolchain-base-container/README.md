# Base Image for the Griffin+ Build Environment based on Ubuntu 18.04 LTS

[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/22/master?label=Pipeline%20Status)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=22)
[![Docker Pulls](https://img.shields.io/docker/pulls/griffinplus/toolchain-base.svg)](https://hub.docker.com/r/griffinplus/toolchain-base/)

This image is built on top of Ubuntu 18.04 LTS and brings along common development tools that are needed to build C/C++
projects. It does not contain any toolchains. Derived images add the toolchain depending on specific build scenarios.
The toolchains are available at the [project page](https://github.com/GriffinPlus/toolchains).

The following tools are installed from the official Ubuntu package repositories:

- curl
- git
- make
- nano
- patch
- wget
- zip

The following tools are installed from their official project websites:

- cmake v3.16.2

## License

The blueprint for this docker image is under the [MIT license](https://github.com/GriffinPlus/toolchains/blob/master/LICENSE),
but as for almost all Docker images the built image contains other software that is subject to different open-source licenses.
By using the image you agree to comply with the licenses of all software within the image.
