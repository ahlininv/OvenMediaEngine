cmake_minimum_required(VERSION 3.12)

set ( TARGET segment_publishers )
add_library(${TARGET}
        segment_publisher.cpp
        segment_stream/segment_stream.cpp
        segment_stream/segment_stream_interceptor.cpp
        segment_stream/stream_packetizer.cpp
        segment_stream/segment_worker_manager.cpp
        segment_stream/segment_http_server_manager.cpp
        segment_stream/packetizer/m4s_writer.cpp
        segment_stream/packetizer/packetizer.cpp
        segment_stream/packetizer/cmaf_chunk_writer.cpp
        segment_stream/packetizer/m4s_segment_writer.cpp
        segment_stream/packetizer/m4s_init_writer.cpp
        segment_stream/segment_stream_server.cpp
        hls/hls_packetizer.cpp
        hls/hls_publisher.cpp
        hls/hls_interceptor.cpp
        hls/hls_application.cpp
        hls/hls_stream_packetizer.cpp
        hls/hls_stream_server.cpp
        dash/dash_packetizer.cpp
        dash/dash_publisher.cpp
        dash/dash_stream_packetizer.cpp
        dash/dash_stream_server.cpp
        dash/dash_application.cpp
        dash/dash_interceptor.cpp
        cmaf/cmaf_application.cpp
        cmaf/cmaf_interceptor.cpp
        cmaf/cmaf_stream_server.cpp
        cmaf/cmaf_publisher.cpp
        cmaf/cmaf_packetizer.cpp
        cmaf/cmaf_stream_packetizer.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )