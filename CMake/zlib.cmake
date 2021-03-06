find_package(ZLIB)
if(NOT ZLIB_FOUND)
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/zlib-1.2.8.tar.gz")
message(STATUS "zlib support requested but not found, please wait while the software package is downloaded...")
set(ENV{http_proxy} "${HTTP_PROXY}")
file(DOWNLOAD "http://zlib.net/zlib-1.2.8.tar.gz" "${CMAKE_SOURCE_DIR}/zlib-1.2.8.tar.gz" STATUS zlib_dl_status LOG zlib_dl_log SHOW_PROGRESS)
if(NOT zlib_dl_status MATCHES "0;\"no error\"")
message("Download failed, did you set a proxy? ${zlib_dl_status}")
endif(NOT zlib_dl_status MATCHES "0;\"no error\"")
message(STATUS "Done downloading zlib")
endif(NOT EXISTS "${CMAKE_SOURCE_DIR}/zlib-1.2.8.tar.gz")

if(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/zlib-1.2.8")
message(STATUS "Extracting zlib-1.2.8.tar.gz...")
execute_process(COMMAND cmake -E tar xzvf zlib-1.2.8.tar.gz WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ERROR_VARIABLE extract_result)
message(STATUS "Extract Result ${extract_result}")
endif(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/zlib-1.2.8")
# Add zlib to the project
add_subdirectory(zlib-1.2.8)
set(ZLIB_INCLUDE_DIR ${CMAKE_BINARY_DIR}/zlib-1.2.8 ${CMAKE_SOURCE_DIR}/zlib-1.2.8)
set(ZLIB_INCLUDE_DIRS ${CMAKE_BINARY_DIR}/zlib-1.2.8 ${CMAKE_SOURCE_DIR}/zlib-1.2.8)
set(ZLIB_HOME "${CMAKE_BINARY_DIR}/zlib-1.2.8")
set(ZLIB_PREFIX_PATH "${CMAKE_BINARY_DIR}/zlib-1.2.8")
set(ZLIB_LIBRARIES zlib)
set(ZLIB_LIBRARY zlib)
set(ZLIB_LIBRARY_FWK zlib)
set(ZLIB_LIBRARY_REL zlib)
set(ZLIB_LIBRARY_DBG zlib)
set(ZLIB_FOUND 1)
endif(NOT ZLIB_FOUND)
