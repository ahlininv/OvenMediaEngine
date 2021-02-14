cmake_minimum_required(VERSION 3.12)

set ( TARGET webrtc_publisher )
add_library(${TARGET}
        rtc_stream.cpp
        rtc_session.cpp
        webrtc_publisher.cpp
        rtc_application.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )