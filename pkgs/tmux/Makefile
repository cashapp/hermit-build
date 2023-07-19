VERSION ?= 3.3a
NAME = tmux
SOURCE = https://github.com/tmux/tmux/releases/download/$(VERSION)/tmux-$(VERSION).tar.gz
DEPS = libevent

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk


configure:
	export LIBEVENT_CFLAGS=-I$(DEPSDIR)/include; \
	export LIBEVENT_LIBS="-L$(DEPSDIR)/lib -levent -levent_core"; \
	./configure --prefix=/ --disable-rpath --disable-utf8proc

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
