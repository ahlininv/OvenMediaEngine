cmake_minimum_required(VERSION 3.12)

set ( TARGET provider )
add_library(${TARGET}
        application.cpp
        provider.cpp
        stream.cpp
        pull_provider/application.cpp
        pull_provider/provider.cpp
        pull_provider/stream.cpp
        pull_provider/stream_motor.cpp
        push_provider/application.cpp
        push_provider/provider.cpp
        push_provider/stream.cpp
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