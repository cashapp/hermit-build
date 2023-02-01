# the nodejs build already includes building its dependencies like v8, openssl, and statically links them.
# however the public binaries are built against newer glibc than centos 7 has, which is something we need.
# the build will take over 2 hours.
VERSION ?= v18.13.0
NAME = node
SOURCE = https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

# Override the top level directory in the output archive to match the
# nodejs.org archives.
OUTPUT_DIRNAME = $(NAME)-$(VERSION)-$(OS)-$(ARCH)

configure:
	./configure --prefix=/

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
