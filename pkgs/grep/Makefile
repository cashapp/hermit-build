VERSION ?= 3.8
NAME = grep
SOURCE = https://ftpmirror.gnu.org/grep/grep-$(VERSION).tar.xz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-rpath

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
