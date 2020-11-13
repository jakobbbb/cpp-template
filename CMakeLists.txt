cmake_minimum_required(VERSION 3.9)
project(Helloworld)

find_package(OpenMP REQUIRED)

if(("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    OR ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    OR (("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel") AND UNIX))
  set(CMAKE_CXX_FLAGS "-std=c++17 -Wall")
  set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
  set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++17 -Wall")
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/external)

if(MSVC)
  add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif(MSVC)

#check for CMakeLists.txt files in subdirectory source (where your applications are)
add_subdirectory(source)
