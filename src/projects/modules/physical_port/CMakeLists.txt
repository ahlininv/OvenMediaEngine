cmake_minimum_required(VERSION 3.12)

set ( TARGET physical_port )
add_library(${TARGET}
        physical_port_manager.cpp
        physical_port.cpp
        physical_port_worker.cpp
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