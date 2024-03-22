#!/bin/bash

set -xeuo pipefail

mkdir build
cd build

cmake -LAH --debug-find --log-level=DEBUG --trace-source=ROCMSetupVersion.cmake --trace-source=CMakeLists.txt ${CMAKE_ARGS} ..

make VERBOSE=1 -j${CPU_COUNT}
make install

# Duplicate folder. Not needed
rm -rf ${PREFIX}/hip
