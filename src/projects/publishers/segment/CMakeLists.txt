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