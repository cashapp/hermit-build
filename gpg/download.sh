#!/bin/bash

set -euxo pipefail

source ./env

curl -LO https://gnupg.org/ftp/gcrypt/gnupg/gnupg-${version}.tar.bz2
