export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

OUT = apidiff-$(GOOS)-$(GOARCH)

all: sync
	make GOOS=linux GOARCH=amd64 build
	make GOOS=linux GOARCH=arm64 build
	make GOOS=darwin GOARCH=amd64 build
	make GOOS=darwin GOARCH=arm64 build

sync:
	test -r go.mod || go mod init install
	go get golang.org/x/exp/cmd/apidiff@latest

build: clean
	go build -o $(OUT) golang.org/x/exp/cmd/apidiff
	bzip2 -9 $(OUT)

clean:
	rm -f $(OUT) $(OUT).bz2
