set( CMAKE_SYSTEM_NAME Windows )
set( CMAKE_SYSTEM_PROCESSOR i686 )

set( CMAKE_SYSROOT /usr/local/x-tools/i686-w64-mingw32/i686-w64-mingw32/sysroot )
set( CMAKE_STAGING_PREFIX /tmp/staging )

set( tools /usr/local/x-tools/i686-w64-mingw32 )
set( CMAKE_C_COMPILER ${tools}/bin/i686-w64-mingw32-gcc )
set( CMAKE_CXX_COMPILER ${tools}/bin/i686-w64-mingw32-g++ )
set( CMAKE_RC_COMPILER ${tools}/bin/i686-w64-mingw32-windres )

set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )

if( INSTALL_TOOLCHAIN_FILES )

    set( TOOLCHAIN_RUNTIME_FILES
         "${CMAKE_SYSROOT}/usr/i686-w64-mingw32/bin/libwinpthread-1.dll" )

    install( FILES ${TOOLCHAIN_RUNTIME_FILES} TYPE BIN )

endif()