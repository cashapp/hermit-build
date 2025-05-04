VERSION ?= 1.31.0
NAME = ghpc

SOURCE = https://github.com/GoogleCloudPlatform/hpc-toolkit/archive/refs/tags/v$(VERSION).tar.gz

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	echo "Nothing to configure"

build:
	$(MAKE) ghpc

install:
	cp ./ghpc $(DESTDIR)