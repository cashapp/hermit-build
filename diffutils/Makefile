VERSION ?= 3.8
DESTDIR ?= $(CURDIR)/dist

.PHONY: all
all: diffutils.tar.xz
	rm -rf build
	mkdir build
	tar -C build --strip-components 1 -xvf diffutils.tar.xz 
	$(MAKE) -C build -f ../Makefile build
	mv build/dist diffutils-$(VERSION)
	tar cfJv diffutils-$(VERSION).tar.xz diffutils-$(VERSION)

.PHONY: build
build:
	./configure --prefix=/ --disable-rpath --without-libiconv-prefix --without-libintl-prefix
	$(MAKE) -j8
	$(MAKE) DESTDIR=$(DESTDIR) install

diffutils.tar.xz:
	curl -L https://ftpmirror.gnu.org/diffutils/diffutils-$(VERSION).tar.xz -o diffutils.tar.xz
