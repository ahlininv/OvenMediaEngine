cmake_minimum_required(VERSION 3.12)

set ( TARGET provider )
add_library(${TARGET}
        application.cpp
        provider.cpp
        stream.cpp
        pull_provider/application.cpp
        pull_provider/provider.cpp
        pull_provider/stream.cpp
        pull_provider/stream_motor.cpp
        push_provider/application.cpp
        push_provider/provider.cpp
        push_provider/stream.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )