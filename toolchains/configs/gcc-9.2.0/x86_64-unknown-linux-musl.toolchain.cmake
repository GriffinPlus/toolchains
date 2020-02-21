set( CMAKE_SYSTEM_NAME Linux )
set( CMAKE_SYSTEM_PROCESSOR x86_64 )

set( CMAKE_SYSROOT /usr/local/x-tools/x86_64-unknown-linux-musl/x86_64-unknown-linux-musl/sysroot )
set( CMAKE_STAGING_PREFIX /tmp/staging )

set( tools /usr/local/x-tools/x86_64-unknown-linux-musl )
set( CMAKE_C_COMPILER ${tools}/bin/x86_64-unknown-linux-musl-gcc )
set( CMAKE_CXX_COMPILER ${tools}/bin/x86_64-unknown-linux-musl-g++ )

set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY  )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )

if( INSTALL_TOOLCHAIN_FILES )

#    file( MAKE_DIRECTORY "${CMAKE_BINARY_DIR}/tmp/toolchain" )
#    file( CREATE_LINK "libc.so" "${CMAKE_BINARY_DIR}/tmp/toolchain/ld-musl-x86_64.so.1" SYMBOLIC )
#    file(GLOB TOOLCHAIN_LIBRARY_FILES
#        "${CMAKE_SYSROOT}/lib/libatomic.so*"
#        "${CMAKE_SYSROOT}/lib/libgcc_s.so*"
#        "${CMAKE_SYSROOT}/lib/libstdc++.so*"
#        "${CMAKE_SYSROOT}/usr/lib/libc.so"
#        "${CMAKE_BINARY_DIR}/tmp/toolchain/ld-musl-x86_64.so*" )

#    install( FILES ${TOOLCHAIN_LIBRARY_FILES} TYPE LIB )

endif()