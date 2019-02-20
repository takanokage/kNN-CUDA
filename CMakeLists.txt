cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

project("separable-kNN-CUDA" CXX CUDA)

# help debug this CMakeLists.txt
# set(CMAKE_VERBOSE_MAKEFILE ON)

# create library
set(KNN_CUDA_LIBRARY kNN-CUDA)
add_library(${KNN_CUDA_LIBRARY} STATIC src/knncuda.cu)
set_target_properties(${KNN_CUDA_LIBRARY} PROPERTIES
                      CUDA_SEPARABLE_COMPILATION ON
                      ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib"
                      LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/lib")

# create executable
set(KNN_CUDA_TEST_EXE test-kNN-CUDA)
add_executable(${KNN_CUDA_TEST_EXE} test.cpp)
include_directories(src)
target_link_libraries(${KNN_CUDA_TEST_EXE} PRIVATE ${KNN_CUDA_LIBRARY} cublas)
set_target_properties(${KNN_CUDA_TEST_EXE} PROPERTIES
                      CUDA_SEPARABLE_COMPILATION ON
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")
