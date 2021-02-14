cmake_minimum_required(VERSION 3.12)

set ( TARGET mpegts_provider )
add_library(${TARGET}
        mpegts_provider.cpp
        mpegts_stream.cpp
        mpegts_application.cpp

        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )