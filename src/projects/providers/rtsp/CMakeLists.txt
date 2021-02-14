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

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )