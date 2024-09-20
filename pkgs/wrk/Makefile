VERSION ?= 4.2.0
NAME = wrk
SOURCE = https://github.com/wg/wrk/archive/refs/tags/$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

build:
	$(MAKE)

install:
	install -m755 wrk $(DESTDIR)/$(NAME)
