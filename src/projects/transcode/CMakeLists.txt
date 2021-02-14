cmake_minimum_required(VERSION 3.12)

set ( TARGET transcoder )
add_library(${TARGET}
        transcode_stream.cpp
        codec/transcode_codec_enc_hevc.cpp
        codec/transcode_decoder.cpp
        codec/transcode_codec_enc_aac.cpp
        codec/transcode_codec_enc_png.cpp
        codec/transcode_encoder.cpp
        codec/transcode_codec_dec_aac.cpp
        codec/transcode_codec_dec_hevc.cpp
        codec/transcode_codec_enc_jpeg.cpp
        codec/transcode_codec_dec_avc.cpp
        codec/transcode_codec_enc_vp8.cpp
        codec/transcode_codec_enc_avc.cpp
        codec/transcode_codec_enc_opus.cpp
        codec/transcode_base.cpp
        transcoder.cpp
        transcode_application.cpp
        filter/media_filter_rescaler.cpp
        filter/media_filter_resampler.cpp
        filter/transcode_filter.cpp
        transcode_context.cpp
        )

target_include_directories(${TARGET}
        PRIVATE
        ../../projects
        ../../projects/third_party
        )

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(srt)
add_external_library(libavcodec)

target_compile_options(${TARGET}
        PUBLIC -std=c++17
        PRIVATE -Wfatal-errors
        )