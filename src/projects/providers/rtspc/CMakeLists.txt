cmake_minimum_required(VERSION 3.12)

set ( TARGET rtspc_provider )
add_library(${TARGET}
        rtspc_application.cpp
        rtspc_stream.cpp
        rtspc_provider.cpp
        )

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

pkg_search_module( MY_SRT REQUIRED srt)

message(STATUS MY_SRT_FOUND: ${MY_SRT_FOUND})

target_link_libraries(${TARGET} PRIVATE ${MY_SRT_LDFLAGS})

target_link_directories(${TARGET} PUBLIC ${MY_SRT_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_SRT_INCLUDE_DIRS})

add_common_compile_options( ${TARGET} )