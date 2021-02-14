cmake_minimum_required(VERSION 3.12)

set ( TARGET rtp_rtcp )
add_library(${TARGET}
        red_rtp_packet.cpp
        rtp_packetizer_h265.cpp
        rtp_packetizer_h264.cpp
        rtcp_info/nack.cpp
        rtcp_info/report_block.cpp
        rtcp_info/receiver_report.cpp
        rtcp_info/sender_report.cpp
        rtcp_info/rtcp_sr_generator.cpp
        rtx_rtp_packet.cpp
        ulpfec_generator.cpp
        rtp_packetizing_manager.cpp
        rtcp_receiver.cpp
        rtp_packet.cpp
        rtp_rtcp.cpp
        rtp_packetizer_vp8.cpp
        rtp_packetizer.cpp
        rtcp_packet.cpp
        rtp_history.cpp
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