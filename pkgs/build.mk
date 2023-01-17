TOPDIR = $(shell git rev-parse --show-toplevel)/pkgs
OS = $(shell go env GOOS)
ARCH = $(shell go env GOARCH)

ifndef NAME
$(error NAME is not set)
endif
ifndef VERSION
$(error VERSION is not set)
endif
ifndef SOURCE
$(error SOURCE is not set)
endif

DESTDIR ?= $(TOPDIR)/$(NAME)/dist
DEPSDIR = $(TOPDIR)/$(NAME)/deps

.PHONY: configure build install

OUTPUT = $(NAME)-$(VERSION)-$(OS)-$(ARCH).tar.xz

.PHONY: all
all: $(OUTPUT)

deps: $(DEPS)
	mkdir -p $(DEPSDIR)
	for dep in $(DEPS); do \
		cp -a ../$$dep/dist/* $(DEPSDIR)/; \
	done

.PHONY: clean
clean:
	rm -rf build dist deps $(OUTPUT) $(NAME)-$(VERSION)

$(OUTPUT): pkg.tar.gz
	$(MAKE) clean deps
	mkdir build dist
	tar -C build --strip-components 1 -xf pkg.tar.gz 
	sandbox $(MAKE) -C build -f ../Makefile configure
	sandbox $(MAKE) -C build -f ../Makefile build
	sandbox $(MAKE) -C build -f ../Makefile install
	cp -a dist $(NAME)-$(VERSION)
	tar cfJ $(OUTPUT) $(NAME)-$(VERSION)

$(DEPS):
	$(MAKE) -C ../$@

pkg.tar.gz:
	curl -L $(SOURCE) -o pkg.tar.gz
