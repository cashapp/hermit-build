VERSION ?= 12.2.1
NAME = graphviz
SOURCE = https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/$(VERSION)/graphviz-$(VERSION).tar.xz
DEPS = libsodium libargon2

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
