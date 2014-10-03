if(WINDOWS)
# Download Windows Astyle binary.
if(NOT EXISTS "${CMAKE_SOURCE_DIR}/AStyle_2.04_windows.zip")
message(STATUS "Please wait while downloading the Astyle code beautifier...")
set(ENV{http_proxy} "${HTTP_PROXY}")
file(DOWNLOAD "http://iweb.dl.sourceforge.net/project/astyle/astyle/astyle%202.04/AStyle_2.04_windows.zip" "${CMAKE_SOURCE_DIR}/AStyle_2.04_windows.zip" STATUS astyle_dl_status LOG astyle_dl_log SHOW_PROGRESS)
if(NOT astyle_dl_status MATCHES "0;\"no error\"")
file(REMOVE "${CMAKE_SOURCE_DIR}/AStyle_2.04_windows.zip")
message(FATAL_ERROR "Download failed, did you set a proxy? STATUS: ${astyle_dl_status}")
endif(NOT astyle_dl_status MATCHES "0;\"no error\"")
message(STATUS "Done downloading Astyle binary")
endif(NOT EXISTS "${CMAKE_SOURCE_DIR}/AStyle_2.04_windows.zip")

# Extract Astyle.
IF(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/AStyle_2.04_windows")
MESSAGE(STATUS "Extracting Astyle...")
EXECUTE_PROCESS(COMMAND cmake -E tar xjvf AStyle_2.04_windows.zip WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} ERROR_VARIABLE extract_result)
MESSAGE(STATUS "Extract Result ${extract_result}")
ENDIF(NOT IS_DIRECTORY "${CMAKE_SOURCE_DIR}/AStyle_2.04_windows")

endif(WINDOWS)