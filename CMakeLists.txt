cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

project(test-kNN-CUDA CXX CUDA)

# help debug this CMakeLists.txt
# set(CMAKE_VERBOSE_MAKEFILE ON)

add_subdirectory(src)

# create executable
add_executable(${PROJECT_NAME} test.cpp)
include_directories(src)
target_link_libraries(${PROJECT_NAME} PRIVATE kNN-CUDA cublas)
set_target_properties(${PROJECT_NAME} PROPERTIES
                      CUDA_SEPARABLE_COMPILATION ON
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")
