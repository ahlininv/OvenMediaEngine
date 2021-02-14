cmake_minimum_required(VERSION 3.12)

set ( TARGET mpegts_module )
add_library(${TARGET}
        mpegts_pes.cpp
        mpegts_packet.cpp
        mpegts_section.cpp
        mpegts_depacketizer.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )