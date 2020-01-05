# Prebuilt Toolchains for Cross-Compiling for Common Targets

[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/20/master?label=Building%20Toolchain%20Builder%20Images)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=20)
[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/22/master?label=Building%20Toolchain%20Base%20Image)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=22)

[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/21/master?label=Building%20Toolchains%20%28gcc-9.2.0%29)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=21)
[![Pipeline Status](https://img.shields.io/azure-devops/build/griffinplus/788a3dbf-c773-454e-803a-eaebc02f7f84/24/master?label=Dockerizing%20Toolchains%20%28gcc-9.2.0%29)](https://dev.azure.com/griffinplus/Cross-Toolchains/_build?definitionId=24)


## Overview

This project uses [crosstool-NG](https://crosstool-ng.github.io) to build a set
of toolchains needed for building other *Griffin+* projects. Although this
project provides a couple of toolchains, it makes no claim to completeness. If
some other toolchain is needed, the scripts provided with the repository may
assist with building a custom toolchain tailored to a specific need.

Features of the toolchains:
- Runs on the common 64-bit x86 platform (`x86_64`, aka `x64` or `AMD64`)
- No dependencies as everything is statically linked into the tools
- [musl libc](https://www.musl-libc.org) is used as C runtime on Linux targets
  to allow linking all dependencies (incl. the C runtime itself) statically
  into target binaries
- [mingw-w64](https://mingw-w64.org) is used as C runtime on Windows targets to
  reduce dependencies to DLLs that are always existent on Windows platforms
- The C runtime is compiled as *Position Independent Code (PIC)* to allow linking
  the C runtime statically into shared objects (if the target supports them)

All toolchains are provided as downloads or in a docker image based on Ubuntu
18.04 LTS along with tools commonly used to build C/C++ projects - a perfect fit for
CI runner images. Please see the documentation of the [toolchain base image](https://github.com/GriffinPlus/toolchains/tree/master/toolchain-base-container)
for details about installed tools.

## Releases

The built toolchains can be downloaded from the [Releases](https://github.com/GriffinPlus/toolchains/releases)
section. Furthermore the toolchains are also available as docker images that can
directly be used in a CI pipeline. The docker images are available from the
[Docker Hub](https://hub.docker.com/repository/docker/griffinplus/toolchain).
The different toolchains can be selected via the image tag.

## License

The project itself is subject to the [MIT license](https://github.com/GriffinPlus/toolchains/blob/master/LICENSE).

The provided toolchain packages are built from source using [crosstool-NG](https://crosstool-ng.github.io).
The software packages that go into the toolchains are subject to their own licenses.
The license texts are bundled with the toolchain packages. The docker images
encorporating the toolchains contain even more third-party software that come
under a variety of open-source licenses. All licenses allow the use in commercial
and non-commercial environments. By using this project, a built toolchain or a
toolchain docker image you agree to comply with all licenses.

## Links to Related Projects

- [crosstool-NG](https://crosstool-ng.github.io)
- Compiler + Runtime
  - [GNU Compiler Collection (GCC)](https://gcc.gnu.org)
  - [GNU Binutils](https://www.gnu.org/software/binutils)
  - [Linux Kernel](https://www.kernel.org)
  - [musl C Library](https://www.musl-libc.org)
- Debugging
  - [DUMA](http://duma.sourceforge.net)
  - [GDB](https://www.gnu.org/software/gdb)
- Companion Libraries
  - [expat](https://libexpat.github.io)
  - [gettext](https://www.gnu.org/software/gettext)
  - [GMP](https://gmplib.org)
  - [ISL](http://isl.gforge.inria.fr)
  - [libelf](https://directory.fsf.org/wiki/Libelf)
  - [libiconv](https://www.gnu.org/software/libiconv)
  - [MPC](http://www.multiprecision.org)
  - [MPFR](http://www.mpfr.org)
  - [ncurses](https://invisible-island.net/ncurses)
  - [zlib](https://sourceforge.net/projects/libpng)
- Companion Tools
  - [autoconf](https://www.gnu.org/software/autoconf)
  - [automake](https://www.gnu.org/software/automake)

