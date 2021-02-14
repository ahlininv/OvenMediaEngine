cmake_minimum_required(VERSION 3.12)

set ( TARGET rtmp_provider )
add_library(${TARGET}
        chunk/rtmp_handshake.cpp
        chunk/rtmp_import_chunk.cpp
        chunk/rtmp_chunk_parser.cpp
        chunk/rtmp_export_chunk.cpp
        chunk/amf_document.cpp
        chunk/rtmp_mux_util.cpp
        rtmp_provider.cpp
        rtmp_application.cpp
        rtmp_stream.cpp
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