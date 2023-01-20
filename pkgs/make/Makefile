VERSION ?= 4.4
NAME = make
SOURCE = https://ftpmirror.gnu.org/make/make-$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-shared

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
