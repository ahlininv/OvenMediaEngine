cmake_minimum_required(VERSION 3.12)
project(application)
set ( TARGET application )
add_library(${TARGET}
        application.cpp
        audio_track.cpp
        certificate.cpp
        host.cpp
        logger_tag_info.cpp
        media_track.cpp
        push.cpp
        record.cpp
        session.cpp
        stream.cpp
        vhost_app_name.cpp
        video_track.cpp
        )

target_include_directories(${TARGET}
        PRIVATE
        ../../../projects
        ../../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

pkg_search_module( MY_SRT REQUIRED srt )

message(STATUS MY_SRT_FOUND: ${MY_SRT_FOUND})
message(STATUS MY_SRT_LDFLAGS: ${MY_SRT_LDFLAGS})
message(STATUS MY_SRT_LIBRARIES: ${MY_SRT_LIBRARIES})
message(STATUS MY_SRT_LDFLAGS: ${MY_SRT_LDFLAGS})
message(STATUS MY_SRT_INCLUDE_DIRS: ${MY_SRT_INCLUDE_DIRS})
message(STATUS MY_SRT_LIBRARY_DIRS: ${MY_SRT_LIBRARY_DIRS})

target_link_libraries(${TARGET}
        PRIVATE ${MY_SRT_LDFLAGS}
        )

target_link_directories(${TARGET} PUBLIC ${MY_SRT_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_SRT_INCLUDE_DIRS})

target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )