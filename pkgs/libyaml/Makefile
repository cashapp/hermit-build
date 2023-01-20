VERSION ?= 0.2.5
NAME = libyaml
SOURCE = https://github.com/yaml/libyaml/releases/download/$(VERSION)/yaml-$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ --disable-shared

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
