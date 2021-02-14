cmake_minimum_required(VERSION 3.12)

set ( TARGET file )
add_library(${TARGET}
        file_writer.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )