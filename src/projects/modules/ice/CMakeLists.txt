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

include_common_dirs(${TARGET} "../../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

add_external_library(${TARGET} srt )
add_common_compile_options( ${TARGET} )