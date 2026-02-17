VERSION ?= 1.0.29
NAME = libusb
SOURCE = https://github.com/libusb/libusb/releases/download/v${VERSION}/libusb-${VERSION}.tar.bz2

include $(shell git rev-parse --show-toplevel)/pkgs/build.mk

configure:
	./configure --enable-static --disable-shared --prefix=/

build:
	make -j8

install:
	make DESTDIR=$(DESTDIR) install
