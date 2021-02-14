cmake_minimum_required(VERSION 3.12)

set ( TARGET pugixml )
add_library(${TARGET}
        docs/samples/save_stream.cpp
        docs/samples/load_file.cpp
        docs/samples/traverse_iter.cpp
        docs/samples/text.cpp
        docs/samples/save_options.cpp
        docs/samples/xpath_variables.cpp
        docs/samples/traverse_predicate.cpp
        docs/samples/traverse_rangefor.cpp
        docs/samples/load_error_handling.cpp
        docs/samples/save_file.cpp
        docs/samples/load_memory.cpp
        docs/samples/custom_memory_management.cpp
        docs/samples/modify_remove.cpp
        docs/samples/save_custom_writer.cpp
        docs/samples/xpath_error.cpp
        docs/samples/save_subtree.cpp
        docs/samples/xpath_select.cpp
        docs/samples/modify_add.cpp
        docs/samples/traverse_walker.cpp
        docs/samples/load_options.cpp
        docs/samples/load_stream.cpp
        docs/samples/xpath_query.cpp
        docs/samples/modify_base.cpp
        docs/samples/save_declaration.cpp
        docs/samples/include.cpp
        docs/samples/traverse_base.cpp
        src/pugixml.cpp
        contrib/foreach.hpp
        src/pugiconfig.hpp
        src/pugixml.hpp
        )

include_common_dirs(${TARGET} "../../")

target_include_directories(${TARGET} PRIVATE src)

set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )