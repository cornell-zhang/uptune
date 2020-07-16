cmake_minimum_required(VERSION 2.8)
project(UPTUNE)

set(CMAKE_CXX_COMPILER g++)

add_definitions(-std=c++11 -O2 -march=native)
add_definitions(-Wall -Wextra -Wabi -Wsign-conversion -Wformat -Wformat-security)
# add_definitions(-Werror)
add_definitions(-pedantic)
add_definitions(-fstack-protector -fPIE -fPIC)
add_definitions(-Wno-unused-function)
add_definitions(-D_FORTIFY_SOURCE=2)

# Debug and logging
add_definitions(-DLOG_LEVEL=3)

set(LIBRARIES ${LIBRARIES} pthread -pie)
set(LIBRARIES ${LIBRARIES} -luuid)

# Testing
enable_testing()
find_package(GTest REQUIRED)

include_directories(${CMAKE_SOURCE_DIR}/src)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(SOURCES
    src/uptune.cc)

set(TEST_SOURCES
    tests/cpp/test_basic.cc
    tests/cpp/test_main.cc)

# Compile tests
add_executable(uptune_tests ${SOURCES} ${TEST_SOURCES})
target_link_libraries(uptune_tests ${GTEST_LIBRARIES} ${LIBRARIES})

