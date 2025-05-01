VERSION ?= 1.0.20
NAME = libsodium
SOURCE = https://download.libsodium.org/libsodium/releases/libsodium-$(VERSION)-stable.tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-shared

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
