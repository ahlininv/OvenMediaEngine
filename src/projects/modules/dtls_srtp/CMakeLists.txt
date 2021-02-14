cmake_minimum_required(VERSION 3.12)

set ( TARGET dtls_srtp )
add_library(${TARGET}
        srtp_adapter.cpp
        srtp_transport.cpp
        dtls_transport.cpp
        dtls_ice_transport.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )