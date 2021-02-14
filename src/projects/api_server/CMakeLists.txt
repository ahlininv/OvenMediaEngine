cmake_minimum_required(VERSION 3.12)
project(ovcrypto)
set ( TARGET api_server )
add_library(${TARGET}
        converters/common.cpp
        converters/metrics.cpp
        converters/push.cpp
        converters/vhost.cpp
        converters/others.cpp
        converters/stream.cpp
        converters/record.cpp
        converters/application.cpp
        controllers/v1/v1_controller.cpp
        controllers/v1/stats/current/current_controller.cpp
        controllers/v1/stats/current/vhosts/vhosts_controller.cpp
        controllers/v1/stats/current/vhosts/apps/streams/streams_controller.cpp
        controllers/v1/stats/current/vhosts/apps/apps_controller.cpp
        controllers/v1/stats/stats_controller.cpp
        controllers/v1/vhosts/vhosts_controller.cpp
        controllers/v1/vhosts/apps/app_actions_controller.cpp
        controllers/v1/vhosts/apps/output_profiles/output_profiles_controller.cpp
        controllers/v1/vhosts/apps/streams/streams_controller.cpp
        controllers/v1/vhosts/apps/apps_controller.cpp
        controllers/controller.cpp
        controllers/root_controller.cpp
        helpers/helpers.cpp
        api_server.cpp
        )

include_common_dirs(${TARGET} "../../")
set(ENV{PKG_CONFIG_PATH} /opt/ovenmediaengine/lib/pkgconfig)

find_package(PkgConfig REQUIRED)
message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

pkg_search_module( MY_OPENSSL REQUIRED openssl )

message(STATUS MY_OPENSSL_FOUND: ${MY_OPENSSL_FOUND})
message(STATUS MY_OPENSSL_LDFLAGS: ${MY_OPENSSL_LDFLAGS})
message(STATUS MY_OPENSSL_LIBRARIES: ${MY_OPENSSL_LIBRARIES})
message(STATUS MY_OPENSSL_LDFLAGS: ${MY_OPENSSL_LDFLAGS})
message(STATUS MY_OPENSSL_INCLUDE_DIRS: ${MY_OPENSSL_INCLUDE_DIRS})
message(STATUS MY_OPENSSL_LIBRARY_DIRS: ${MY_OPENSSL_LIBRARY_DIRS})

target_link_libraries(${TARGET}
        PRIVATE ${MY_OPENSSL_LDFLAGS}
        )

target_link_directories(${TARGET} PUBLIC ${MY_OPENSSL_LIBRARY_DIRS})

target_include_directories(${TARGET} PUBLIC ${MY_OPENSSL_INCLUDE_DIRS})

add_common_compile_options( ${TARGET} )