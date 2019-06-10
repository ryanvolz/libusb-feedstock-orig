#!/bin/bash

mkdir build
cd build
../configure --prefix=${PREFIX} --disable-udev
make
make install
