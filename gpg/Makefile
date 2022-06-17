version = 1.4.23
target_version = 1.4.23-2
dist = $(shell pwd)/dist
build = $(shell pwd)/build
release = gnupg-$(version)
archive = $(release).tar.bz2
archive_path = $(build)/$(archive)
os = $(shell uname | tr '[:upper:]' '[:lower:]')
arch = $(shell uname -m)
ifeq ($(arch),x86_64)
	arch = amd64
endif
package = gnupg-$(target_version)-$(os)-$(arch).tar.bz2

.PHONY: clean download build package inspect

all: clean download build inspect package

download:
	mkdir -p $(build)
	cd $(build) && curl -LO https://gnupg.org/ftp/gcrypt/gnupg/$(archive)

build:
	mkdir -p $(dist)
	cd $(build) && tar xjf $(archive_path)
	cd $(build)/$(release) && ./configure --without-bzip2 --without-readline --with-included-gettext --prefix="${dist}"
	cd $(build)/$(release) && make && make install

ifeq ($(os),darwin)
inspect:
	cd $(dist) && otool -L bin/gpg
endif

ifeq ($(os),linux)
inspect:
	cd $(dist) && ldd bin/gpg
endif

package:
	tar -cjSf $(package) -C $(dist) .

clean:
	rm -rf $(dist)
	rm -rf $(build)
