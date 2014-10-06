cmake_minimum_required(VERSION 3.0.0)
project(AeonOgre)

set(HTTP_PROXY "" CACHE STRING "HTTP proxy for package downloading.")
set(OGRE_SRC_DOWNLOAD_SERVER "hivelocity.dl.sourceforge.net" CACHE STRING "HTTP proxy for package downloading.")

if(WIN32)
add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif(WIN32)

#set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
#set(LIBRARY_OUTPUT_PATH  ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_MODULE_PATH 
    "${CMAKE_SOURCE_DIR}/CMake")

include(astyle)
# While listed as optional Ogre 1.8.1 won't compile without zlib or zziplib.
include(zlib)
include(zziplib)
include(ois)
# Ogre3d requires freetype
include(freetype)
include(ogre3d)
