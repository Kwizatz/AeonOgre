cmake_minimum_required(VERSION 3.0.0)
project(AeonOgre)

set(HTTP_PROXY "" CACHE STRING "HTTP proxy for package downloading.")
set(OGRE_SRC_DOWNLOAD_SERVER "hivelocity.dl.sourceforge.net" CACHE STRING "HTTP proxy for package downloading.")

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH  ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")

# Ogre3d requires freetype
include(freetype)
include(ogre3d)
