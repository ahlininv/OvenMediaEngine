cmake_minimum_required(VERSION 3.12)

set ( TARGET mpegts_module )
add_library(${TARGET}
        mpegts_pes.cpp
        mpegts_packet.cpp
        mpegts_section.cpp
        mpegts_depacketizer.cpp
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