cmake_minimum_required(VERSION 3.12)

set ( TARGET sdp )
add_library(${TARGET}
        media_description.cpp
        common_attr.cpp
        payload_attr.cpp
        session_description.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )