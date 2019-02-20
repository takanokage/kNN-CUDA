cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

project("separable-kNN-CUDA" CXX CUDA)

# help debug this CMakeLists.txt
# set(CMAKE_VERBOSE_MAKEFILE ON)

# all .cu .cuh files in lib dir
file(GLOB KNN_CUDA_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cu)
file(GLOB KNN_CUDA_HDRS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cuh)

# create library
add_library(kNN-CUDA STATIC ${KNN_CUDA_SRCS} ${KNN_CUDA_HDRS})
set_target_properties(kNN-CUDA PROPERTIES
                      CUDA_SEPARABLE_COMPILATION ON
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib")

# create executable
add_executable("test-kNN-CUDA" test.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/)
target_link_libraries("test-kNN-CUDA" PRIVATE kNN-CUDA cublas)
set_target_properties("test-kNN-CUDA" PROPERTIES
                      CUDA_SEPARABLE_COMPILATION ON
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")
