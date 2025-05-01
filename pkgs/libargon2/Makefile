VERSION ?= 20190702
NAME = libargon2
SOURCE = https://github.com/P-H-C/phc-winner-argon2/archive/refs/tags/$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
