VERSION ?= 1.7.4.4
NAME = socat
SOURCE = http://www.dest-unreach.org/socat/download/socat-$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/

build:
	$(MAKE) progs

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
