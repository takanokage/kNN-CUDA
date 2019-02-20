cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

project(kNN-CUDA CXX CUDA)

# help debug this CMakeLists.txt
# set(CMAKE_VERBOSE_MAKEFILE ON)

# create library
add_library(${PROJECT_NAME} STATIC knncuda.cu)
set_target_properties(${PROJECT_NAME} PROPERTIES
                      CUDA_SEPARABLE_COMPILATION ON
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../build/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../build/lib")
