# Docker Images with Cross-Toolchains based on GCC 8.3.0

[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/20/master?label=Building%20Toolchain%20Builder%20Images)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=20)
[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/21/master?label=Building%20Toolchains%20%28gcc-8.3.0%29)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=21)
[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/22/master?label=Building%20Toolchain%20Base%20Image)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=22)
[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/24/master?label=Dockerizing%20Toolchains%20%28gcc-8.3.0%29)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=24)

## Overview

These docker images provide a cross-compilation environment based on cross-toolchains that
have been built by [Griffin+](https://github.com/griffinplus). The image tags select the
target platform of the encorporated toolchain. The following toolchains are available:

| Toolchain Tuple           | Image (Docker Hub)
| :------------------------ | :--------------------------------------------
| i686-unknown-linux-musl   | `griffinplus/toolchain-gcc-8.3.0:i686-unknown-linux-musl`
| i686-w64-mingw32          | `griffinplus/toolchain-gcc-8.3.0:i686-w64-mingw32`
| x86_64-unknown-linux-musl | `griffinplus/toolchain-gcc-8.3.0:x86_64-unknown-linux-musl`
| x86_64-w64-mingw32        | `griffinplus/toolchain-gcc-8.3.0:x86_64-w64-mingw32`

Please see the [project page](https://github.com/GriffinPlus/toolchains) for details.

## Using

The toolchain is installed in the container at `/usr/local/x-tools/<toolchain-tuple>/`.
The sysroot of the cross-compiler is at `/usr/local/x-tools/<toolchain-tuple>/<toolchain-tuple>/sysroot`.

### Building with CMake

The container contains a *CMake* toolchain file at `/cmake/toolchain-<toolchain-tuple>.cmake`. To build a project using
*CMake* the toolchain file must be specified using `-DCMAKE_TOOLCHAIN_FILE="/cmake/toolchain-<toolchain-tuple>.cmake"`.
The toolchain files set the staging directory to `/tmp/staging`. The *CMake* *install* target copies its files into this
directory to keep the sysroot of the toolchain pristine.

## License

The project itself is subject to the [MIT license](https://github.com/GriffinPlus/toolchains/blob/master/LICENSE).

The provided toolchain packages are built from source using [crosstool-NG](https://crosstool-ng.github.io).
The software packages that go into the toolchains are subject to their own licenses.
The license texts are bundled with the toolchain packages and the docker images.
The docker images encorporating the toolchains contain even more third-party software
that come under a variety of open-source licenses. All licenses allow the use in
commercial and non-commercial environments. By using this project, a built toolchain
or a toolchain docker image you agree to comply with all licenses.
