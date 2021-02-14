cmake_minimum_required(VERSION 3.12)

set ( TARGET ovt_publisher )
add_library(${TARGET}
        ovt_application.cpp
        ovt_stream.cpp
        build/CMakeFiles/3.19.4/CompilerIdCXX/CMakeCXXCompilerId.cpp
        ovt_session.cpp
        ovt_publisher.cpp
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