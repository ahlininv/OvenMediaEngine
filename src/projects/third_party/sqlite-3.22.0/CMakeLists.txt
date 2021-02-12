cmake_minimum_required(VERSION 3.12)

set ( TARGET sqlite )
add_library(${TARGET} SHARED
        sqlite3.c
        shell.c
        )

target_compile_options(${TARGET}
        PRIVATE -Wfatal-errors
        )