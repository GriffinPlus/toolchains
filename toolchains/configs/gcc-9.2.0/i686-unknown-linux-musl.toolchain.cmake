set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR i686)

set(CMAKE_SYSROOT /usr/local/x-tools/i686-unknown-linux-musl/i686-unknown-linux-musl/sysroot)
set(CMAKE_STAGING_PREFIX /tmp/staging)

set(tools /usr/local/x-tools/i686-unknown-linux-musl)
set(CMAKE_C_COMPILER ${tools}/bin/i686-unknown-linux-musl-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/i686-unknown-linux-musl-g++)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
