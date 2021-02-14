cmake_minimum_required(VERSION 3.12)

set ( TARGET ovt_publisher )
add_library(${TARGET}
        ovt_application.cpp
        ovt_stream.cpp
        build/CMakeFiles/3.19.4/CompilerIdCXX/CMakeCXXCompilerId.cpp
        ovt_session.cpp
        ovt_publisher.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )