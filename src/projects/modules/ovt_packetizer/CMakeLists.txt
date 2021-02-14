cmake_minimum_required(VERSION 3.12)

set ( TARGET ovt_packetizer )
add_library(${TARGET}
        ovt_depacketizer.cpp
        ovt_packet.cpp
        ovt_packetizer.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )