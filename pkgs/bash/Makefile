VERSION ?= 5.2.15
NAME = bash
SOURCE = https://ftpmirror.gnu.org/bash/bash-$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
