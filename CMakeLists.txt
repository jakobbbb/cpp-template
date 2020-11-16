cmake_minimum_required(VERSION 3.9 FATAL_ERROR)
project(Helloworld)

if(("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    OR ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    OR (("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel") AND UNIX))
  set(CMAKE_CXX_FLAGS "-Wall")
  set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
  set(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "-Wall")
endif()

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++17" COMPILER_SUPPORTS_CXX17)
if(COMPILER_SUPPORTS_CXX17)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
else()
  message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++17 support. Please use a different C++ compiler.")
endif()

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/external)

if(MSVC)
  add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif(MSVC)

set(LIBRARIES)

find_package(OpenMP REQUIRED)
if(OpenMP_CXX_FOUND)
    set(LIBRARIES ${LIBRARIES} OpenMP::OpenMP_CXX)
endif()

#check for CMakeLists.txt files in subdirectory source (where your applications are)
add_subdirectory(source)
