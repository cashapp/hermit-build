NAME = make
VERSION ?= 4.4
SOURCE = https://ftpmirror.gnu.org/make/make-$(VERSION).tar.gz

# Disable -static because it breaks make
override undefine CFLAGS
override undefine CXXFLAGS
override undefine LDFLAGS

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --without-guile

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
