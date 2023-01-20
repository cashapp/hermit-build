VERSION ?= 3.8
NAME = diffutils
SOURCE = https://ftpmirror.gnu.org/diffutils/diffutils-$(VERSION).tar.xz 

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-rpath

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
