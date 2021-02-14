
function(add_external_library LIBNAME)
    find_package(PkgConfig REQUIRED)
    message(STATUS PkgConfig_FOUND: ${PkgConfig_FOUND})

    message(STATUS "TRY TO FIND:" (${LIBNAME}))
    pkg_search_module( MY_${LIBNAME} REQUIRED ${LIBNAME})

    set(NAME_FOUND FOUND)
    set(NAME_LIBS LIBS)
    set(NAME_INCLUDE_DIRS INCLUDE_DIRS)
    set(NAME_LDFLAGS_HERE LDFLAGS_HERE)

    set(FOUND ${MY_${LIBNAME}_FOUND})
    set(LIBS ${MY_${LIBNAME}_LIBRARIES})
    set(INCLUDE_DIRS ${MY_${LIBNAME}_INCLUDE_DIRS})
    set(LDFLAGS_HERE ${MY_${LIBNAME}_LDFLAGS})

    message( STATUS "${NAME_FOUND}: "       ${${NAME_FOUND}})
    message( STATUS "${NAME_LIBS}: "       ${${NAME_LIBS}})
    message( STATUS "${NAME_INCLUDE_DIRS}: "       ${${NAME_INCLUDE_DIRS}})
    message( STATUS "${NAME_LDFLAGS_HERE}: "       ${${NAME_LDFLAGS_HERE}})

    target_link_libraries(${TARGET}      PUBLIC ${${NAME_LIBS}})
    target_link_directories(${TARGET}    PUBLIC  ${${NAME_INCLUDE_DIRS}} )
    target_include_directories(${TARGET} PUBLIC  ${${NAME_INCLUDE_DIRS}} )
endfunction()