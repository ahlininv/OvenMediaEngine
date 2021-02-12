cmake_minimum_required(VERSION 3.12)

set ( TARGET ice )
add_library(${TARGET}
        stun/stun_message.cpp
        stun/attributes/stun_message_integrity_attribute.cpp
        stun/attributes/stun_xor_mapped_address_attribute.cpp
        stun/attributes/stun_unknown_attribute.cpp
        stun/attributes/stun_mapped_address_attribute.cpp
        stun/attributes/stun_attribute.cpp
        stun/attributes/stun_user_name_attribute.cpp
        stun/attributes/stun_fingerprint_attribute.cpp
        ice_candidate.cpp
        ice_port.cpp
        ice_port_manager.cpp
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