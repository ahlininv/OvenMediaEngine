cmake_minimum_required(VERSION 3.12)

set ( TARGET config )
add_library(${TARGET}
        config_loader.cpp
        config_manager.cpp
        utilities/config_utility.cpp
        utilities/config_macro_converter.cpp
        engine/data_source.cpp
        engine/value_type.cpp
        engine/item.cpp
        engine/item_name.cpp
        engine/config_error.cpp
        config_logger_loader.cpp
        )

include_common_dirs(${TARGET} "../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )