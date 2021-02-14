cmake_minimum_required(VERSION 3.12)

set ( TARGET physical_port )
add_library(${TARGET}
        physical_port_manager.cpp
        physical_port.cpp
        physical_port_worker.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )