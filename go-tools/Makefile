export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

SUFFIX = $(GOOS)-$(GOARCH)

UNVERSIONED_TOOLS = golang.org/x/exp/cmd/apidiff 
TOOLS = golang.org/x/tools:cmd/stringer \
	github.com/mailru/easyjson:easyjson

all: sync
	make GOOS=linux GOARCH=amd64 build
	make GOOS=linux GOARCH=arm64 build
	make GOOS=darwin GOARCH=amd64 build
	make GOOS=darwin GOARCH=arm64 build

sync:
	test -r go.mod || go mod init install
	go get $$(for tool in $(UNVERSIONED_TOOLS); do echo $$tool@latest; done)
	go get $$(for tool in $(TOOLS); do \
		echo $$(echo $$tool | tr : /)@latest; \
	done)

build: clean
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