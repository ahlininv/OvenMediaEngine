cmake_minimum_required(VERSION 3.12)

set ( TARGET rtmppush_publisher )
add_library(${TARGET}
        rtmppush_userdata.cpp
        rtmppush_session.cpp
        rtmppush_publisher.cpp
        rtmppush_application.cpp
        rtmppush_stream.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )