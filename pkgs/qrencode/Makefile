NAME = qrencode
VERSION ?= 4.1.1
SOURCE = https://fukuchi.org/works/qrencode/qrencode-${VERSION}.tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
