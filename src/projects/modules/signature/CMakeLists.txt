cmake_minimum_required(VERSION 3.12)

set ( TARGET signature )
add_library(${TARGET}
        signed_policy.cpp
        signed_token.cpp
        )

target_include_directories(${TARGET}
        PRIVATE
        ../../../projects
        ../../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

pkg_search_module( openssl REQUIRED openssl)

message(STATUS openssl_FOUND: ${openssl_FOUND})

target_link_libraries(${TARGET}
        PRIVATE ${openssl_LDFLAGS}
        )

target_link_directories(${TARGET} PUBLIC ${openssl_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${openssl_INCLUDE_DIRS})

target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )