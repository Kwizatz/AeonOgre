#find_package(OIS)
#if(NOT ZLIB_FOUND)
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/ois_v1-3.tar.gz")
message(STATUS "Please wait while the OIS source package is downloaded...")
set(ENV{http_proxy} "${HTTP_PROXY}")
file(DOWNLOAD "http://superb-dca2.dl.sourceforge.net/project/wgois/Source%20Release/1.3/ois_v1-3.tar.gz" "${CMAKE_SOURCE_DIR}/ois_v1-3.tar.gz" STATUS zlib_dl_status LOG zlib_dl_log SHOW_PROGRESS)
if(NOT zlib_dl_status MATCHES "0;\"no error\"")
message("Download failed, did you set a proxy? ${zlib_dl_status}")
endif(NOT zlib_dl_status MATCHES "0;\"no error\"")
endif(NOT EXISTS "${CMAKE_SOURCE_DIR}/ois_v1-3.tar.gz")

if(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/ois-v1-3")
message(STATUS "Extracting ois_v1-3.tar.gz...")
execute_process(COMMAND cmake -E tar xzvf ois_v1-3.tar.gz WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ERROR_VARIABLE extract_result)
message(STATUS "Extract Result ${extract_result}")
endif(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/ois-v1-3")

set(OIS_SOURCES
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISInputManager.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISObject.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISEffect.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISJoyStick.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISKeyboard.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISForceFeedback.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/OISException.cpp
)
if(WIN32)
set(OIS_PLATFORM_SOURCES
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/win32/Win32InputManager.cpp
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/win32/Win32KeyBoard.cpp
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/win32/Win32ForceFeedback.cpp
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/win32/Win32JoyStick.cpp
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/win32/Win32Mouse.cpp
)
else(WIN32)
set(OIS_PLATFORM_SOURCES
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/linux/EventHelpers.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/linux/LinuxInputManager.cpp
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/linux/LinuxJoyStickEvents.cpp
    ${CMAKE_SOURCE_DIR}/ois-v1-3/src/linux/LinuxForceFeedback.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/linux/LinuxKeyboard.cpp
	${CMAKE_SOURCE_DIR}/ois-v1-3/src/linux/LinuxMouse.cpp
)
endif(WIN32)

set(OIS_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/ois-v1-3/includes")
set(OIS_INCLUDE_DIRS "${CMAKE_SOURCE_DIR}/ois-v1-3/includes")
set(OIS_LIBRARIES ois dxguid dinput8 xinput)
set(OIS_LIBRARY ois)

include_directories("${CMAKE_SOURCE_DIR}/ois-v1-3/includes")
add_library(ois ${OIS_SOURCES} ${OIS_PLATFORM_SOURCES})

set(OIS_FOUND 1)

#endif(NOT ZLIB_FOUND)
