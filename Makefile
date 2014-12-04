PROJECT ?= abevoelker/example_rails_docker_ci
TAG     ?= latest

ifdef REGISTRY
  IMAGE=$(REGISTRY)/$(PROJECT):$(TAG)
else
  IMAGE=$(PROJECT):$(TAG)
endif

all:
	@echo "Available targets:"
	@echo "  * build - build a Docker image for $(IMAGE)"
	@echo "  * pull  - pull down previous docker builds of $(IMAGE)"
	@echo "  * test  - build and test $(IMAGE)"

build:
	docker build -t $(IMAGE) .

pull:
	docker pull $(IMAGE) || true

test: build
	fig run web ./env/test.sh ./test.sh
