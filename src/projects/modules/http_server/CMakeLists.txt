cmake_minimum_required(VERSION 3.12)

set ( TARGET http_server )
add_library(${TARGET}
        http_response.cpp
        interceptors/web_socket/web_socket_frame.cpp
        interceptors/web_socket/web_socket_interceptor.cpp
        interceptors/web_socket/web_socket_client.cpp
        interceptors/default/http_default_interceptor.cpp
        interceptors/http_request_interceptor.cpp
        https_server.cpp
        http_server.cpp
        http_server_manager.cpp
        http_request.cpp
        http_client.cpp
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