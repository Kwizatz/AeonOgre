# Download Ogre3d source code.
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1.tar.bz2")
message(STATUS "Please wait while the Ogre3d source package is downloaded...")
set(ENV{http_proxy} "${HTTP_PROXY}")
file(DOWNLOAD "http://${OGRE_SRC_DOWNLOAD_SERVER}/project/ogre/ogre/1.8/1.8.1/ogre_src_v1-8-1.tar.bz2" "${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1.tar.bz2" STATUS ogre3d_dl_status LOG ogre3d_dl_log SHOW_PROGRESS)
if(NOT ogre3d_dl_status MATCHES "0;\"no error\"")
file(REMOVE "${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1.tar.bz2")
message(FATAL_ERROR "Download failed, did you set a proxy? STATUS: ${ogre3d_dl_status}")
endif(NOT ogre3d_dl_status MATCHES "0;\"no error\"")
message(STATUS "Done downloading Ogre3d Source")
endif(NOT EXISTS "${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1.tar.bz2")

# Extract Ogre3d source code.
IF(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1")
MESSAGE(STATUS "Extracting Ogre3d source code...")
EXECUTE_PROCESS(COMMAND cmake -E tar xjvf ogre_src_v1-8-1.tar.bz2 WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ERROR_VARIABLE extract_result)
MESSAGE(STATUS "Extract Result ${extract_result}")
ENDIF(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1")

ADD_SUBDIRECTORY("${CMAKE_SOURCE_DIR}/ogre_src_v1-8-1")
