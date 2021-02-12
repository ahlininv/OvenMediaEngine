cmake_minimum_required(VERSION 3.12)

set ( TARGET rtsp_provider )
add_library(${TARGET}
        rtsp_media_info.cpp
        rtsp_response.cpp
        rtsp_server.cpp
        sdp.cpp
        rtsp_application.cpp
        rtsp_stream.cpp
        rtsp_rtp_demuxer.cpp
        rtsp_request_parser.cpp
        rtsp_request.cpp
        rtp/rtp_udp_track.cpp
        rtp/rtp_track.cpp
        rtp/rtp_tcp_track.cpp
        rtp/rtp_packet_header.cpp
        rtsp_provider.cpp
        rtcp/rtcp_packet_header.cpp
        rtsp_connection.cpp
        sdp_format_parameters.cpp
        rtsp.cpp

        )

target_include_directories(${TARGET}
        PRIVATE
        ../../../projects
        ../../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

pkg_search_module( MY_SRT REQUIRED srt )

message(STATUS MY_SRT_FOUND: ${MY_SRT_FOUND})

target_link_libraries(${TARGET}
        PRIVATE ${MY_SRT_LDFLAGS}
        )

target_link_directories(${TARGET} PUBLIC ${MY_SRT_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_SRT_INCLUDE_DIRS})

target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )