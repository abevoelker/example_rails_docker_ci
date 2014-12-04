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
	@echo "  * pull  - pull $(IMAGE)"
	@echo "  * push  - push $(IMAGE)"
	@echo "  * test  - build and test $(IMAGE)"

build: Dockerfile
	docker build -t $(IMAGE) .

pull:
	docker pull $(IMAGE) || true

push:
	docker push $(IMAGE)

test: build
	fig run web ./env/test.sh ./test.sh
