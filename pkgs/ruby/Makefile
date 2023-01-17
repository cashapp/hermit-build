NAME = ruby
VERSION ?= 3.2.0
SOURCE = https://cache.ruby-lang.org/pub/ruby/3.2/ruby-${VERSION}.tar.gz
#DEPS = zlib libressl libyaml libffi
DEPS = libyaml libffi libressl

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --prefix=/ \
		--disable-shared \
		--enable-load-relative \
		--disable-install-doc \
		--disable-install-rdoc \
		--disable-install-capi \
		--with-libyaml-dir=$(DEPSDIR) \
		--with-libffi-dir=$(DEPSDIR) \
		--with-openssl-dir=$(DEPSDIR)

build:
	$(MAKE)

install:
	$(MAKE) DESTDIR=$(DESTDIR) install
