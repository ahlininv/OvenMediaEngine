cmake_minimum_required(VERSION 3.12)

set ( TARGET dtls_srtp )
add_library(${TARGET}
        srtp_adapter.cpp
        srtp_transport.cpp
        dtls_transport.cpp
        dtls_ice_transport.cpp
        )

target_include_directories(${TARGET}
        PRIVATE
        ../../../projects
        ../../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(srt)
target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )