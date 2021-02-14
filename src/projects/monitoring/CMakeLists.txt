cmake_minimum_required(VERSION 3.12)

set ( TARGET monitoring )
add_library(${TARGET}
        stream_metrics.cpp
        application_metrics.cpp
        host_metrics.cpp
        monitoring_interceptor.cpp
        monitoring.cpp
        common_metrics.cpp
        )

target_include_directories(${TARGET}
        PRIVATE
        ../../projects
        ../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(srt)
target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )