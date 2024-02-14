export CGO_ENABLED = 0
export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

SUFFIX = $(GOOS)-$(GOARCH)

UNVERSIONED_TOOLS = golang.org/x/exp/cmd/apidiff@latest \
					github.com/robertkrimen/godocdown/godocdown@latest \
					golang.org/x/vuln/cmd/govulncheck@latest \
					github.com/kisielk/godepgraph@latest \
					github.com/subfuzion/envtpl/cmd/envtpl@master \
					github.com/brendanjryan/k8split@latest \
					go.uber.org/nilaway/cmd/nilaway@latest
TOOLS = golang.org/x/tools:cmd/stringer \
	golang.org/x/tools:cmd/goimports \
	github.com/mailru/easyjson:easyjson \
	github.com/dmarkham/enumer \
	github.com/planetscale/vtprotobuf:cmd/protoc-gen-go-vtproto \
	connectrpc.com/connect:cmd/protoc-gen-connect-go \
	github.com/jfeliu007/goplantuml:cmd/goplantuml \
	github.com/buildpacks/scafall \
	braces.dev/errtrace:cmd/errtrace \
	github.com/deepmap/oapi-codegen/v2/cmd/oapi-codegen

all:
	make GOOS=linux GOARCH=amd64 clean build
	make GOOS=linux GOARCH=arm64 clean build
	make GOOS=darwin GOARCH=amd64 clean build
	make GOOS=darwin GOARCH=arm64 clean build

build:
	mkdir -p unversioned
	for tool in $(UNVERSIONED_TOOLS); do \
		tool=$${tool%@*}; \
		echo $$tool; \
		rm -f go.mod go.sum; \
		go mod init install; \
		go get $$tool; \
		go build -o unversioned/$$(basename $$tool)-$(SUFFIX) $$tool; \
		bzip2 -9 unversioned/$$(basename $$tool)-$(SUFFIX); \
	done
	for tool in $(TOOLS); do \
		module=$$(echo $$tool | cut -d: -f1); \
		version=$$(go list -m -f '{{ .Version }}' $$module); \
		echo $$module-$$version; \
		rm -f go.mod go.sum; \
		go mod init install; \
		go get $$module; \
		pkg=$$(echo $$tool | tr : /); \
		binary=$$(echo $$pkg | awk -F / '{print $$NF}'); \
		go build -o $$binary-$$version-$(SUFFIX) $$pkg; \
		bzip2 -9 $$binary-$$version-$(SUFFIX); \
	done

clean:
	rm -f *$(SUFFIX) *$(SUFFIX).bz2 unversioned/*$(SUFFIX).bz2
