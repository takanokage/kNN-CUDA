cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

# use the root folder as the project name
get_filename_component(ProjectName ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${ProjectName} CXX CUDA)

# all .cu .cuh files in lib dir
file(GLOB KNN_CUDA_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/*.cu)
file(GLOB KNN_CUDA_HDRS ${CMAKE_CURRENT_SOURCE_DIR}/*.cuh)

# modern cmake is cuda aware, cuda prefix is gone
add_library(${ProjectName} STATIC ${KNN_CUDA_SRCS} ${KNN_CUDA_HDRS})

# ask for separate compilation on lib
set_target_properties(${ProjectName} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

set_target_properties(${ProjectName} PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib")

set(KNN_CUDA_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR})
set(KNN_CUDA_LIBRARY_DIR  ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)
set(KNN_CUDA_LIBRARIES    ${ProjectName})

message(STATUS "KNN_CUDA_INCLUDE_DIRS: ${KNN_CUDA_INCLUDE_DIRS}")
message(STATUS "KNN_CUDA_LIBRARY_DIR : ${KNN_CUDA_LIBRARY_DIR}")
message(STATUS "KNN_CUDA_LIBRARIES   : ${KNN_CUDA_LIBRARIES}")

set(KNN_CUDA_INCLUDE_DIRS ${KNN_CUDA_INCLUDE_DIRS} PARENT_SCOPE)
set(KNN_CUDA_LIBRARY_DIR  ${KNN_CUDA_LIBRARY_DIR}  PARENT_SCOPE)
set(KNN_CUDA_LIBRARIES    ${KNN_CUDA_LIBRARIES}    PARENT_SCOPE)
