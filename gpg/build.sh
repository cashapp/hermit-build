#!/bin/bash

set -euxo pipefail

source ./env

mkdir dist
dist=$(pwd)/dist

mkdir -p build
build=$(pwd)/build

archive="$(pwd)/gnupg-${version}.tar.bz2"

pushd "${build}"
tar vzxf ${archive}
pushd "gnupg-${version}"
./configure --enable-static --prefix="${dist}"
make
make install
popd
popd
