cmake_minimum_required(VERSION 3.12)

set ( TARGET webrtc_publisher )
add_library(${TARGET}
        rtc_stream.cpp
        rtc_session.cpp
        webrtc_publisher.cpp
        rtc_application.cpp
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