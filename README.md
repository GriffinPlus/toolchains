# Prebuilt Toolchains for Cross-Compiling for Common Targets

## Overview

This project uses [crosstool-NG](https://crosstool-ng.github.io) to build a set
of toolchains needed for building other *GriffinPlus* projects. Although this
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
18.04 along with tools commonly used to build C/C++ projects - a perfect fit for
CI runner images.

The following tools are shipped with the docker images:

- `curl`
- `git`
- `make`
- `nano`
- `patch`
- `wget`

## Supported Target Platforms

The toolchains contain the following ingredients as presented by `ct-ng show-config`.

### i686-unknown-linux-musl

This toolchain compiles for Linux on a 32 bit x86 CPU (Pentium-II or higher).

```
[l..X]   i686-unknown-linux-musl
    Languages       : C,C++,Fortran
    OS              : linux-4.20.8
    Binutils        : binutils-2.32
    Compiler        : gcc-8.3.0
    C library       : musl-1.1.21
    Debug tools     : duma-2_5_15 gdb-8.2.1
    Companion libs  : cloog-0.18.4 expat-2.2.6 gettext-0.19.8.1 gmp-6.1.2 isl-0.20 libelf-0.8.13 libiconv-1.15 mpc-1.1.0 mpfr-4.0.2 ncurses-6.1 zlib-1.2.11
    Companion tools :
```

#### Downloads

| Status         | Toolchain      | Docker Image
| :------------- | :------------- | :-------------
| Development    | [Download](https://s3.eu-central-1.wasabisys.com/griffinplus-toolchains-releases/i686-unknown-linux-musl-branch-master.tar.gz) | `registry.gitlab.com/griffinplus/toolchains/i686-unknown-linux-musl:master`

--------------------------------------------------------------------------------

### i686-w64-mingw32

This toolchain compiles for Windows on a 32 bit x86 CPU (Pentium-II or higher).

```
[l..X]   i686-w64-mingw32
    Languages       : C,C++
    OS              : windows
    Binutils        : binutils-2.32
    Compiler        : gcc-8.3.0
    C library       : mingw-w64-v6.0.0
    Debug tools     : gdb-8.2.1
    Companion libs  : cloog-0.18.4 expat-2.2.6 gettext-0.19.8.1 gmp-6.1.2 isl-0.20 libelf-0.8.13 libiconv-1.15 mpc-1.1.0 mpfr-4.0.2 ncurses-6.1 zlib-1.2.11
    Companion tools :
```

#### Downloads

| Status         | Toolchain      | Docker Image
| :------------- | :------------- | :-------------
| Development    | [Download](https://s3.eu-central-1.wasabisys.com/griffinplus-toolchains-releases/i686-w64-mingw32-branch-master.tar.gz) | `registry.gitlab.com/griffinplus/toolchains/i686-w64-mingw32:master`

--------------------------------------------------------------------------------

### x86_64-unknown-linux-musl

This toolchain compiles for Linux on a 64 bit x86 CPU. *x86_64* is also known as *x64* and *AMD64*.

```
[l..X]   x86_64-unknown-linux-musl
    Languages       : C,C++,Fortran
    OS              : linux-4.20.8
    Binutils        : binutils-2.32
    Compiler        : gcc-8.3.0
    C library       : musl-1.1.21
    Debug tools     : duma-2_5_15 gdb-8.2.1
    Companion libs  : cloog-0.18.4 expat-2.2.6 gettext-0.19.8.1 gmp-6.1.2 isl-0.20 libelf-0.8.13 libiconv-1.15 mpc-1.1.0 mpfr-4.0.2 ncurses-6.1 zlib-1.2.11
    Companion tools :
```

#### Downloads

| Status         | Toolchain      | Docker Image
| :------------- | :------------- | :-------------
| Development    | [Download](https://s3.eu-central-1.wasabisys.com/griffinplus-toolchains-releases/x86_64-unknown-linux-musl-branch-master.tar.gz) | `registry.gitlab.com/griffinplus/toolchains/x86_64-unknown-linux-musl:master`

--------------------------------------------------------------------------------

### x86_64-w64-mingw32

This toolchain compiles for Windows on a 64 bit x86 CPU. *x86_64* is also known as *x64* and *AMD64*.

```
[l..X]   x86_64-w64-mingw32
    Languages       : C,C++
    OS              : windows
    Binutils        : binutils-2.32
    Compiler        : gcc-8.3.0
    C library       : mingw-w64-v6.0.0
    Debug tools     : gdb-8.2.1
    Companion libs  : cloog-0.18.4 expat-2.2.6 gettext-0.19.8.1 gmp-6.1.2 isl-0.20 libelf-0.8.13 libiconv-1.15 mpc-1.1.0 mpfr-4.0.2 ncurses-6.1 zlib-1.2.11
    Companion tools :
```

#### Downloads

| Status         | Toolchain      | Docker Image
| :------------- | :------------- | :-------------
| Development    | [Download](https://s3.eu-central-1.wasabisys.com/griffinplus-toolchains-releases/x86_64-w64-mingw32-branch-master.tar.gz) | `registry.gitlab.com/griffinplus/toolchains/x86_64-w64-mingw32:master`

--------------------------------------------------------------------------------

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
