set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(CMAKE_SYSROOT /usr/local/x-tools/x86_64-unknown-linux-musl/x86_64-unknown-linux-musl/sysroot)
set(CMAKE_STAGING_PREFIX /tmp/staging)

set(tools /usr/local/x-tools/x86_64-unknown-linux-musl)
set(CMAKE_C_COMPILER ${tools}/bin/x86_64-unknown-linux-musl-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/x86_64-unknown-linux-musl-g++)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

