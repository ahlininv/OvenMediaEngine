cmake_minimum_required(VERSION 3.12)

set ( TARGET rtmppush_publisher )
add_library(${TARGET}
        rtmppush_userdata.cpp
        rtmppush_session.cpp
        rtmppush_publisher.cpp
        rtmppush_application.cpp
        rtmppush_stream.cpp
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