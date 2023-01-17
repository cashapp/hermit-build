VERSION ?= 3.4.4
NAME = libffi
SOURCE = https://github.com/libffi/libffi/releases/download/v$(VERSION)/libffi-$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-shared

build:
	$(MAKE) -j8

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
