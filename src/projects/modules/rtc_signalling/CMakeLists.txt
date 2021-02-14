cmake_minimum_required(VERSION 3.12)

set ( TARGET rtc_signalling )
add_library(${TARGET}
        rtc_signalling_server.cpp
        rtc_ice_candidate.cpp
        p2p/rtc_peer_info.cpp
        p2p/rtc_p2p_manager.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )