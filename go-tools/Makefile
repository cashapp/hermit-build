export CGO_ENABLED = 0
export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

SUFFIX = $(GOOS)-$(GOARCH)

UNVERSIONED_TOOLS = github.com/subfuzion/envtpl/cmd/envtpl@master \
					golang.org/x/exp/cmd/apidiff@latest \
					github.com/robertkrimen/godocdown/godocdown@latest \
					golang.org/x/vuln/cmd/govulncheck@latest \
					github.com/kisielk/godepgraph@latest \
					github.com/brendanjryan/k8split@latest \
					go.uber.org/nilaway/cmd/nilaway@latest
TOOLS =  github.com/99designs/gqlgen \
	github.com/google/wire:cmd/wire \
	github.com/deepmap/oapi-codegen/v2:cmd/oapi-codegen \
	golang.org/x/tools:cmd/stringer \
	golang.org/x/tools:cmd/goimports \
	github.com/mailru/easyjson:easyjson \
	github.com/dmarkham/enumer \
	github.com/planetscale/vtprotobuf:cmd/protoc-gen-go-vtproto \
	connectrpc.com/connect:cmd/protoc-gen-connect-go \
	github.com/jfeliu007/goplantuml:cmd/goplantuml \
	github.com/buildpacks/scafall \
	braces.dev/errtrace:cmd/errtrace \
	github.com/axzilla/templui:cmd/templui

all:
	make GOOS=linux GOARCH=amd64 clean build
	make GOOS=linux GOARCH=arm64 clean build
	make GOOS=darwin GOARCH=amd64 clean build
	make GOOS=darwin GOARCH=arm64 clean build

build:
	for tool in $(TOOLS); do \
		module=$$(echo $$tool | cut -d: -f1); \
		pkg=$$(echo $$tool | tr : /); \
		rm -f go.mod go.sum; \
		go mod init install; \
		go get $$pkg@latest; \
		version=$$(go list -m -f '{{ .Version }}' $$module); \
		echo $$module-$$version; \
		binary=$$(echo $$pkg | awk -F / '{print $$NF}'); \
		go build -o $$binary-$$version-$(SUFFIX) $$pkg; \
		bzip2 -9 $$binary-$$version-$(SUFFIX); \
	done
	mkdir -p unversioned
	set -x; \
	for tool in $(UNVERSIONED_TOOLS); do \
		echo $$tool; \
		rm -f go.mod go.sum; \
		go mod init install; \
		go get $$tool; \
		tool=$${tool%@*}; \
		go build -o unversioned/$$(basename $$tool)-$(SUFFIX) $$tool; \
		bzip2 -9 unversioned/$$(basename $$tool)-$(SUFFIX); \
	done

clean:
	rm -f *$(SUFFIX) *$(SUFFIX).bz2 unversioned/*$(SUFFIX).bz2
