cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

# use the root folder as the project name
get_filename_component(ProjectName ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${ProjectName} CXX CUDA)

# list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_61,code=sm_61)

# help debugging Makefile cmd if ON
set(CMAKE_VERBOSE_MAKEFILE ON)

# modern cmake is cuda aware, cuda prefix is gone
set(KNN_CUDA_LIBRARY ${ProjectName})
add_library(${ProjectName} STATIC knncuda.cu)

# ask for separate compilation on lib
set_target_properties(${ProjectName} PROPERTIES
                      CUDA_RESOLVE_DEVICE_SYMBOLS ON
                      CUDA_SEPARABLE_COMPILATION ON)

set_target_properties(${ProjectName} PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib")

set(KNN_CUDA_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR})
set(KNN_CUDA_LIBRARY_DIR  ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)
set(KNN_CUDA_LIBRARIES    ${ProjectName})

message(STATUS "KNN_CUDA_INCLUDE_DIRS: ${KNN_CUDA_INCLUDE_DIRS}")
message(STATUS "KNN_CUDA_LIBRARY_DIR : ${KNN_CUDA_LIBRARY_DIR}")
message(STATUS "KNN_CUDA_LIBRARIES   : ${KNN_CUDA_LIBRARIES}")

get_directory_property(hasParent PARENT_DIRECTORY)
if(hasParent)
    set(KNN_CUDA_INCLUDE_DIRS ${KNN_CUDA_INCLUDE_DIRS} PARENT_SCOPE)
    set(KNN_CUDA_LIBRARY_DIR  ${KNN_CUDA_LIBRARY_DIR}  PARENT_SCOPE)
    set(KNN_CUDA_LIBRARIES    ${KNN_CUDA_LIBRARIES}    PARENT_SCOPE)
endif()


# # please make sure nvcc dir is in PATH
# project(with-separate CXX CUDA)

# # all .cu .cuh files in lib dir
# file(GLOB LIB_CU_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.cu)
# file(GLOB LIB_CU_HDRS ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.cuh)

# # main.cu in crt dir
# file(GLOB MAIN_CU_SRCS main.cu)

# # only for CLion (derps without a cpp file)
# file(GLOB DUMMY_SRCS dummy.cpp)

# # modern cmake is cuda aware, cuda prefix is gone
# add_library(cmake-with-scl-lib STATIC ${LIB_CU_SRCS} ${LIB_CU_HDRS})

# # ask for separate compilation on lib
# set_target_properties(cmake-with-scl-lib PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
# add_executable(cmake-with-scl ${MAIN_CU_SRCS} ${DUMMY_SRCS})

# # AND ask for separate compilation on exec
# set_target_properties(cmake-with-scl PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
# target_link_libraries(cmake-with-scl PRIVATE cmake-with-scl-lib)