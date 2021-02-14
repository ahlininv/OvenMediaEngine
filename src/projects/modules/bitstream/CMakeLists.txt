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

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )