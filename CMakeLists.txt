cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

project("test-kNN-CUDA" CXX CUDA)

# help debugging Makefile cmd if ON
set(CMAKE_VERBOSE_MAKEFILE ON)

# all .cu .cuh files in lib dir
file(GLOB KNN_CUDA_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.cu)
file(GLOB KNN_CUDA_HDRS ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.cuh)

# create library
add_library(kNN-CUDA STATIC ${KNN_CUDA_SRCS} ${KNN_CUDA_HDRS})
set_target_properties(kNN-CUDA PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

# create executable
add_executable("test-kNN-CUDA" test.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib/)
set_target_properties("test-kNN-CUDA" PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
target_link_libraries("test-kNN-CUDA" PRIVATE kNN-CUDA)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")
