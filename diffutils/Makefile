VERSION ?= 3.8
DESTDIR ?= $(CURDIR)/dist
OS = $(shell go env GOOS)
ARCH = $(shell go env GOARCH)

.PHONY: all
all: diffutils.tar.xz
	rm -rf build
	mkdir build
	tar -C build --strip-components 1 -xvf diffutils.tar.xz 
	sandbox $(MAKE) -C build -f ../Makefile build
	mv build/dist diffutils-$(VERSION)
	tar cfJv diffutils-$(VERSION)-$(OS)-$(ARCH).tar.xz diffutils-$(VERSION)

.PHONY: build
build:
	./configure --prefix=/ --disable-rpath
	$(MAKE) -j8
	$(MAKE) DESTDIR=$(DESTDIR) install

diffutils.tar.xz:
	curl -L https://ftpmirror.gnu.org/diffutils/diffutils-$(VERSION).tar.xz -o diffutils.tar.xz
