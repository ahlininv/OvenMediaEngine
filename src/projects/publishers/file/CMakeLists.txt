cmake_minimum_required(VERSION 3.12)

set ( TARGET file_publisher )
add_library(${TARGET}
        file_publisher.cpp
        file_application.cpp
        file_session.cpp
        file_export.cpp
        file_stream.cpp
        file_userdata.cpp
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