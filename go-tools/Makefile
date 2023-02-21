export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

SUFFIX = $(GOOS)-$(GOARCH)

UNVERSIONED_TOOLS = golang.org/x/exp/cmd/apidiff \
					github.com/robertkrimen/godocdown/godocdown \
					golang.org/x/vuln/cmd/govulncheck
TOOLS = golang.org/x/tools:cmd/stringer \
	golang.org/x/tools:cmd/goimports \
	github.com/mailru/easyjson:easyjson \
	github.com/dmarkham/enumer \
	github.com/planetscale/vtprotobuf:cmd/protoc-gen-go-vtproto \
	github.com/bufbuild/connect-go:cmd/protoc-gen-connect-go

all: sync
	make GOOS=linux GOARCH=amd64 clean build
	make GOOS=linux GOARCH=arm64 clean build
	make GOOS=darwin GOARCH=amd64 clean build
	make GOOS=darwin GOARCH=arm64 clean build

sync:
	test -r go.mod || go mod init install
	go get $$(for tool in $(UNVERSIONED_TOOLS); do echo $$tool@latest; done) $$(for tool in $(TOOLS); do echo $$(echo $$tool | tr : /); done)

build:
	for tool in $(UNVERSIONED_TOOLS); do \
		go build -o $$(basename $$tool)-$(SUFFIX) $$tool; \
		bzip2 -9 $$(basename $$tool)-$(SUFFIX); \
	done
	for tool in $(TOOLS); do \
		module=$$(echo $$tool | cut -d: -f1); \
		version=$$(go list -m -f '{{ .Version }}' $$module); \
		pkg=$$(echo $$tool | tr : /); \
		binary=$$(echo $$pkg | awk -F / '{print $$NF}'); \
		go build -o $$binary-$$version-$(SUFFIX) $$pkg; \
		bzip2 -9 $$binary-$$version-$(SUFFIX); \
	done

clean:
	rm -f *$(SUFFIX) *$(SUFFIX).bz2
