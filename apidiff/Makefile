export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

SUFFIX = $(GOOS)-$(GOARCH)

all: sync
	make GOOS=linux GOARCH=amd64 build
	make GOOS=linux GOARCH=arm64 build
	make GOOS=darwin GOARCH=amd64 build
	make GOOS=darwin GOARCH=arm64 build

sync:
	test -r go.mod || go mod init install
	go get golang.org/x/exp/cmd/apidiff@latest
	go get golang.org/x/tools/cmd/stringer@latest

build: clean
	go build -o apidiff-$(SUFFIX) golang.org/x/exp/cmd/apidiff
	go build -o stringer-$(SUFFIX) golang.org/x/tools/cmd/stringer
	bzip2 -9 apidiff-$(SUFFIX) stringer-$(SUFFIX)

clean:
	rm -f *$(SUFFIX) *$(SUFFIX).bz2
