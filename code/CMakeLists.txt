cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

# # help debugging Makefile cmd if ON
# set(CMAKE_VERBOSE_MAKEFILE OFF)

# use the root folder as the project name
project("test-kNN-CUDA" CXX CUDA)

# help debugging Makefile cmd if ON
set(CMAKE_VERBOSE_MAKEFILE ON)

# add_subdirectory(kNN-CUDA)

set(KNN_CUDA_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/kNN-CUDA)
set(KNN_CUDA_LIBRARY_DIR  ${CMAKE_CURRENT_SOURCE_DIR}/kNN-CUDA/build/lib)
set(KNN_CUDA_LIBRARIES    kNN-CUDA)

message(STATUS "KNN_CUDA_INCLUDE_DIRS: ${KNN_CUDA_INCLUDE_DIRS}")
message(STATUS "KNN_CUDA_LIBRARY_DIR : ${KNN_CUDA_LIBRARY_DIR}")
message(STATUS "KNN_CUDA_LIBRARIES   : ${KNN_CUDA_LIBRARIES}")

include_directories(${KNN_CUDA_INCLUDE_DIRS})
link_directories(${KNN_CUDA_LIBRARY_DIR})
# link_libraries(${KNN_CUDA_LIBRARY})
# target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${KNN_CUDA_LIBRARY})

add_executable(${CMAKE_PROJECT_NAME} test.cpp ${KNN_CUDA_INCLUDE_DIRS}/knncuda.h)

list(APPEND CUDA_NVCC_FLAGS -gencode arch=compute_61,code=sm_61)

# ask for separate compilation on exec
set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
                      CUDA_RESOLVE_DEVICE_SYMBOLS ON
                      CUDA_SEPARABLE_COMPILATION ON)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build/bin")

# # CMake 3.9 required
# cmake_minimum_required(VERSION 3.9 FATAL_ERROR)

# # help debugging Makefile cmd if ON
# set(CMAKE_VERBOSE_MAKEFILE OFF)

# # Save libs and executables in the same place
# set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin" CACHE PATH
#     "Output directory for applications")

# # help CLion engine with CUDA headers
# include_directories(/usr/local/cuda/include)

# add_subdirectory(with-separate)
# add_subdirectory(without-separate)