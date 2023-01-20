VERSION ?= 3.7.0
NAME = libressl
SOURCE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-shared

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
