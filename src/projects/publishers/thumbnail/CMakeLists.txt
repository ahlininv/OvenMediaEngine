cmake_minimum_required(VERSION 3.12)

set ( TARGET thumbnail_publisher )
add_library(${TARGET}
        thumbnail_application.cpp
        thumbnail_publisher.cpp
        thumbnail_stream.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )