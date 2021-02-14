cmake_minimum_required(VERSION 3.12)

set ( TARGET orchestrator )
add_library(${TARGET}
        data_structures/structures.cpp
        data_structures/enums.cpp
        orchestrator.cpp
        orchestrator_internal.cpp
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