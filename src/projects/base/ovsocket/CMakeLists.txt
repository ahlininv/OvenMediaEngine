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

target_include_directories(${TARGET}
        PRIVATE
        ../../../projects
        ../../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(srt)
target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )