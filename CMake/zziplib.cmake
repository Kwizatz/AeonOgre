#find_package(ZZip)
#if(NOT ZZip_FOUND)
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/zziplib-0.13.62.tar.bz2")
message(STATUS "zlib support requested but not found, please wait while the software package is downloaded...")
set(ENV{http_proxy} "${HTTP_PROXY}")
file(DOWNLOAD "http://softlayer-dal.dl.sourceforge.net/project/zziplib/zziplib13/0.13.62/zziplib-0.13.62.tar.bz2" "${CMAKE_SOURCE_DIR}/zziplib-0.13.62.tar.bz2" STATUS zlib_dl_status LOG zlib_dl_log SHOW_PROGRESS)
if(NOT zlib_dl_status MATCHES "0;\"no error\"")
message("Download failed, did you set a proxy? ${zlib_dl_status}")
endif(NOT zlib_dl_status MATCHES "0;\"no error\"")
message(STATUS "Done downloading zlib")
endif(NOT EXISTS "${CMAKE_SOURCE_DIR}/zziplib-0.13.62.tar.bz2")
if(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/zziplib-0.13.62")
message(STATUS "Extracting zziplib-0.13.62.tar.bz2...")
execute_process(COMMAND cmake -E tar xjvf zziplib-0.13.62.tar.bz2 WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ERROR_VARIABLE extract_result)
message(STATUS "Extract Result ${extract_result}")
endif(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/zziplib-0.13.62")

# Add zziplib to the project

set(ZZip_SOURCES
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/zip.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/file.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/dir.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/stat.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/info.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/err.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/plugin.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/write.c
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/fetch.c
    )
    
set(ZZip_HEADERS
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/stdint.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/file.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/plugin.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/lib.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/zzip.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/zzip32.h
    ${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/write.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/fetch.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/format.h
    ${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/info.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/autoconf.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/types.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/conf.h
	${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/_config.h
    ${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip/_msvc.h
    )

set(ZZip_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/zziplib-0.13.62 ${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip)
set(ZZip_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/zziplib-0.13.62 ${CMAKE_SOURCE_DIR}/zziplib-0.13.62/zzip)
set(ZZip_HOME "${CMAKE_SOURCE_DIR}/zziplib-0.13.62")
set(ZZip_PREFIX_PATH "${CMAKE_SOURCE_DIR}/zziplib-0.13.62")
set(ZZip_LIBRARIES zziplib)
set(ZZip_LIBRARY zziplib)
set(ZZip_LIBRARY_FWK zziplib)
set(ZZip_LIBRARY_REL zziplib)
set(ZZip_LIBRARY_DBG zziplib)

include_directories(${ZLIB_INCLUDE_DIRS} ${ZZip_INCLUDE_DIRS})

add_library(zziplib ${ZZip_SOURCES} ${ZZip_HEADERS})
target_link_libraries(zziplib ${ZLIB_LIBRARIES})

set(ZZip_INCLUDE_DIR "${CMAKE_BINARY_DIR}/zziplib-0.13.62")
set(ZZip_INCLUDE_DIRS "${CMAKE_BINARY_DIR}/zziplib-0.13.62")
set(ZZip_HOME "${CMAKE_BINARY_DIR}/zziplib-0.13.62")
set(ZZip_PREFIX_PATH "${CMAKE_BINARY_DIR}/zziplib-0.13.62")
set(ZZip_LIBRARIES zziplib)
set(ZZip_LIBRARY zziplib)
set(ZZip_LIBRARY_FWK zziplib)
set(ZZip_LIBRARY_REL zziplib)
set(ZZip_LIBRARY_DBG zziplib)
set(ZZip_FOUND 1)
#endif(NOT ZZip_FOUND)
