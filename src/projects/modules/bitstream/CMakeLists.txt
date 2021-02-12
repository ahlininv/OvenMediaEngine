cmake_minimum_required(VERSION 3.12)

set ( TARGET bitstream )
add_library(${TARGET}
        aac/aac_adts.cpp
        aac/aac_specific_config.cpp
        aac/aac_converter.cpp
        h265/h265_converter.cpp
        h265/h265_parser.cpp
        h264/h264_bitstream_analyzer.cpp
        h264/h264_sps_pps_tracker.cpp
        h264/h264_parser.cpp
        h264/h264_slice_types.cpp
        h264/h264_nal_unit_types.cpp
        h264/h264_converter.cpp
        h264/h264_decoder_configuration_record.cpp
        nalu/nal_unit_splitter.cpp
        nalu/nal_unit_bitstream_parser.cpp
        nalu/nal_unit_fragment_header.cpp
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

target_link_libraries(${TARGET}
        PRIVATE ${MY_SRT_LDFLAGS}
        )

target_link_directories(${TARGET} PUBLIC ${MY_SRT_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_SRT_INCLUDE_DIRS})

target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )