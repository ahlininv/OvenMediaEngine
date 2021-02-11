cmake_minimum_required(VERSION 3.12)
project(application)
set ( TARGET ovlibrary )
add_library(${TARGET}
        assert.cpp
        bit_writer.cpp
        bps_calculator.cpp
        byte_stream.cpp
        daemon.cpp
        data.cpp
        delay_queue.cpp
        dump_utilities.cpp
        error.cpp
        event.cpp
        json.cpp
        json_object.cpp
        log.cpp
        log_internal.cpp
        log_write.cpp
        path_manager.cpp
        pcm_utilities.cpp
        platform.cpp
        queue.cpp
        random.cpp
        regex.cpp
        semaphore.cpp
        stack_trace.cpp
        stl.cpp
        stop_watch.cpp
        string.cpp
        url.cpp
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