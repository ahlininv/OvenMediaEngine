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