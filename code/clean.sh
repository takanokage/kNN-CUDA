#!/bin/bash

echo
echo cleaning...

rm -rf build
rm -rf kNN-CUDA/build

# remove the CMake cache
find . -name CMakeFiles -type d -exec rm -rf {} +
find . -name CMakeCache.txt -exec rm -rf {} +
find . -name cmake_install.cmake -exec rm -rf {} +

echo
