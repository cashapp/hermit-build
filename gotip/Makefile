export GOOS ?= $(shell go env GOOS)
export GOARCH ?= $(shell go env GOARCH)

BOOTSTRAP = go-$(GOOS)-$(GOARCH)-bootstrap
OUT = go-tip-$(GOOS)-$(GOARCH).tbz

gotip: clean
	if test -d goroot; then \
		cd goroot && git pull; \
	else \
		git clone --depth=1 https://go.googlesource.com/go goroot; \
	fi
	cd goroot/src && ./bootstrap.bash
	mv $(BOOTSTRAP).tbz $(OUT)

clean:
	rm -rf $(BOOTSTRAP).tbz $(BOOTSTRAP)
