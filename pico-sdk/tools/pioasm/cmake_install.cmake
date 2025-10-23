# Install script for directory: D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/per/Visual Pinball Cabinet Project/pi-pico/PinscapePico/PWMWorker/pioasm-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/pioasm" TYPE EXECUTABLE MESSAGE_NEVER FILES "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/pioasm.exe")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/pioasm/pioasmTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/pioasm/pioasmTargets.cmake"
         "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/CMakeFiles/Export/aa879aa49e585b0a03a73fdf516d8cae/pioasmTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/pioasm/pioasmTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/pioasm/pioasmTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/pioasm" TYPE FILE MESSAGE_NEVER FILES "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/CMakeFiles/Export/aa879aa49e585b0a03a73fdf516d8cae/pioasmTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/pioasm" TYPE FILE MESSAGE_NEVER FILES "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/CMakeFiles/Export/aa879aa49e585b0a03a73fdf516d8cae/pioasmTargets-debug.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/pioasm" TYPE FILE MESSAGE_NEVER FILES
    "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/pioasmConfig.cmake"
    "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/pioasmConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/per/Visual Pinball Cabinet Project/pi-pico/pico-sdk-2.2.0/pico-sdk/tools/pioasm/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
