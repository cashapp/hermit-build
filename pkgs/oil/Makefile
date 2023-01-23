NAME = oil
VERSION ?= 0.14.0
SOURCE = https://www.oilshell.org/download/oil-${VERSION}.tar.gz
DEPS = build-essential libreadline-dev

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
