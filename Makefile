CONTAINER_PATH ?= contiv/netplugin-init
CONTAINER_VERSION ?= $(shell git describe --tags --always)

build:
	docker build --no-cache -t "$(CONTAINER_PATH):$(CONTAINER_VERSION)" .
	docker tag "$(CONTAINER_PATH):$(CONTAINER_VERSION)" "$(CONTAINER_PATH):latest"

.PHONY: build
