#!/bin/bash

set -euxo pipefail

source ./env

os=$(uname | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)
if [[ ${arch} == 'x86_64' ]]; then
  arch=amd64
fi
arch=amd64
tar -cvjSf gnupg-${version}-${os}-${arch}.tar.bz2 -C dist .
