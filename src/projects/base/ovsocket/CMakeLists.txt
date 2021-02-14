cmake_minimum_required(VERSION 3.12)

set ( TARGET ovsocket )
add_library(${TARGET}
        client_socket.cpp
        datagram_socket.cpp
        server_socket.cpp
        socket.cpp
        socket_address.cpp
        socket_utilities.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt  )
add_common_compile_options( ${TARGET} )