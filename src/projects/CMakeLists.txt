cmake_minimum_required(VERSION 3.12)

project(OvenMediaEngine )

add_subdirectory(base)
add_subdirectory(api_server)
add_subdirectory(config)
add_subdirectory(main)
add_subdirectory(mediarouter)
add_subdirectory(modules)
add_subdirectory(monitoring)
add_subdirectory(orchestrator)
add_subdirectory(providers)
add_subdirectory(publishers)
add_subdirectory(third_party)
add_subdirectory(transcode)
add_subdirectory(web_console)

set ( TARGET OvenMediaEngine )
add_executable(${TARGET}
        main/utilities.cpp
        main/third_parties.cpp
        main/signals.cpp
        main/banner.cpp
        main/main.cpp
        )

target_include_directories(${TARGET}
        PRIVATE
        ../../projects
        ../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

set(LIBS_TO_LD
        srt
        libavformat
        libavfilter
        libavcodec
        libswresample
        libswscale
        libavutil
        openssl
        vpx
        opus
        libsrtp
        libsrtp2
        libpcre2-8
        )

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

foreach(LIB ${LIBS_TO_LD})
    message( STATUS TRY TO FIND:(${LIB}))
    pkg_search_module(LIB_FOUND REQUIRED ${LIB})
    message( STATUS LIB_FOUND ( ${LIB}):       ${LIB_FOUND})
    message( STATUS PACKAGE_FOUND ( ${LIB}):       ${${LIB}_FOUND})
    target_link_libraries(${TARGET}      PRIVATE ${${LIB}_LDFLAGS} )

    target_link_directories(${TARGET}    PUBLIC  ${${LIB}_LIBRARY_DIRS} )

    target_include_directories(${TARGET} PUBLIC  ${${LIB}_INCLUDE_DIRS} )

endforeach()

set(CMAKE_FIND_LIBRARY_PREFIXES "")
set(CMAKE_FIND_LIBRARY_SUFFIXES .a .so)

set(INTERNAL_LIBS
        webrtc_publisher
        segment_publishers
        ovt_publisher
        file_publisher
        rtmppush_publisher
        thumbnail_publisher
        ovt_provider
        rtmp_provider
        mpegts_provider
        rtspc_provider
        transcoder
        rtc_signalling
        ice
        api_server
        bitstream
        containers
        http_server
        dtls_srtp
        rtp_rtcp
        sdp
        segment_writer
        web_console
        mediarouter
        ovt_packetizer
        orchestrator
        publisher
        application
        signature
        physical_port
        socket
        ovcrypto
        config
        ovlibrary
        monitoring
        jsoncpp
        sqlite
        file
        rtmp
        )

foreach(ILIB ${INTERNAL_LIBS})
    message( STATUS TRY TO ADD INTERNAL:(${ILIB}))
    target_link_libraries(${TARGET}      PRIVATE ${ILIB} )
endforeach()

target_link_directories(${TARGET} PUBLIC ${MY_SRT_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_SRT_INCLUDE_DIRS})

target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )