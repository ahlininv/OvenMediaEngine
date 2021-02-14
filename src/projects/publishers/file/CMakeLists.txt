cmake_minimum_required(VERSION 3.12)

set ( TARGET file_publisher )
add_library(${TARGET}
        file_publisher.cpp
        file_application.cpp
        file_session.cpp
        file_export.cpp
        file_stream.cpp
        file_userdata.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )