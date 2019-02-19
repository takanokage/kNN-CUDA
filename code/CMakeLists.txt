cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

# # help debugging Makefile cmd if ON
# set(CMAKE_VERBOSE_MAKEFILE OFF)

# use the root folder as the project name
# get_filename_component(ProjectName ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project("test-kNN-CUDA" CXX CUDA)

list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_61,code=sm_61)

add_subdirectory(kNN-CUDA)

message(STATUS "KNN_CUDA_INCLUDE_DIRS: ${KNN_CUDA_INCLUDE_DIRS}")
message(STATUS "KNN_CUDA_LIBRARY_DIR : ${KNN_CUDA_LIBRARY_DIR}")
message(STATUS "KNN_CUDA_LIBRARIES   : ${KNN_CUDA_LIBRARIES}")

include_directories(${KNN_CUDA_INCLUDE_DIRS})
link_directories(${KNN_CUDA_LIBRARY_DIR})
# target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE ${KNN_CUDA_LIBRARY_DIRS} ${KNN_CUDA_LIBRARY})
link_libraries(${KNN_CUDA_LIBRARY})

add_executable(${CMAKE_PROJECT_NAME} test.cpp)

# ask for separate compilation on exec
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")

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
