cmake_minimum_required (VERSION 3.14)

project(CorProfiler)

if(UNIX)
    add_compile_options(-Wno-invalid-noreturn -Wno-pragma-pack -Wno-int-to-pointer-cast -fPIC -fms-extensions -DBIT64 -DPAL_STDCPP_COMPAT -DPLATFORM_UNIX -DHOST_64BIT -std=c++17)

    message("Printing env vars")
    message($ENV{CORECLR_PATH}/pal/inc/rt)
    message($ENV{CORECLR_PATH}/pal/inc)
    message($ENV{CORECLR_PATH}/inc)
    include_directories($ENV{CORECLR_PATH}/pal/inc/rt)
    include_directories($ENV{CORECLR_PATH}/pal/inc)
    include_directories($ENV{CORECLR_PATH}/inc)
endif(UNIX)

if (UNIX AND NOT APPLE)
    add_link_options(--no-undefined -lpthread -lunwind)
endif(UNIX AND NOT APPLE)

if (WIN32)
    set(BASE_SOURCES src/CorProfiler.def)
endif(WIN32)

include_directories($ENV{CORECLR_BIN}/inc)
include_directories($ENV{CORECLR_PATH}/pal/prebuilt/inc)

set(SOURCES ${BASE_SOURCES}
    src/common.cpp
    src/ClassFactory.cpp
    src/CorProfiler.cpp
    src/dllmain.cpp
    $ENV{CORECLR_PATH}/pal/prebuilt/idl/corprof_i.cpp)

add_library(CorProfiler SHARED ${SOURCES})