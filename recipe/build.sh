#!/bin/bash
source activate "${CONDA_DEFAULT_ENV}"

# make builds with gcc>=5 compatible with conda-forge, currently using gcc<5
CXXFLAGS="${CXXFLAGS} -D_GLIBCXX_USE_CXX11_ABI=0"

mkdir build
cd build
../configure --prefix=${PREFIX} --disable-udev --enable-tests-build
make
tests/stress
make install
