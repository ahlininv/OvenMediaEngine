cmake_minimum_required(VERSION 3.12)
project(ovcrypto)
set ( TARGET ovcrypto )
add_library(${TARGET}
        certificate.cpp
        base_64.cpp
        crc_32.cpp
        message_digest.cpp
        openssl/openssl_manager.cpp
        openssl/tls.cpp
        openssl/tls_data.cpp
        )

include_common_dirs(${TARGET} "../../../")

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

pkg_search_module( MY_OPENSSL REQUIRED openssl )

message(STATUS MY_OPENSSL_FOUND: ${MY_OPENSSL_FOUND})
message(STATUS MY_OPENSSL_LDFLAGS: ${MY_OPENSSL_LDFLAGS})
message(STATUS MY_OPENSSL_LIBRARIES: ${MY_OPENSSL_LIBRARIES})
message(STATUS MY_OPENSSL_LDFLAGS: ${MY_OPENSSL_LDFLAGS})
message(STATUS MY_OPENSSL_INCLUDE_DIRS: ${MY_OPENSSL_INCLUDE_DIRS})
message(STATUS MY_OPENSSL_LIBRARY_DIRS: ${MY_OPENSSL_LIBRARY_DIRS})

target_link_libraries(${TARGET}
        PRIVATE ${MY_OPENSSL_LDFLAGS}
        )

target_link_directories(${TARGET} PUBLIC ${MY_OPENSSL_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_OPENSSL_INCLUDE_DIRS})

add_common_compile_options( ${TARGET} )