VERSION ?= 9.1
NAME = coreutils
SOURCE = https://ftpmirror.gnu.org/coreutils/coreutils-$(VERSION).tar.xz 

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/ --disable-rpath || (cat config.log ; exit 1)

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
