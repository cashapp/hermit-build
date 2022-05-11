export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

OUT = apidiff-$(GOOS)-$(GOARCH)

build: clean
	test -r go.mod || go mod init install
	go get golang.org/x/exp/cmd/apidiff@latest
	go build -o $(OUT) golang.org/x/exp/cmd/apidiff
	bzip2 -9 $(OUT)

clean:
	rm -f $(OUT)
