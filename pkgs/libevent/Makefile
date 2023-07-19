VERSION ?= 2.1.12
NAME = libevent
SOURCE = https://github.com/libevent/libevent/releases/download/release-$(VERSION)-stable/libevent-$(VERSION)-stable.tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-shared --disable-openssl

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
