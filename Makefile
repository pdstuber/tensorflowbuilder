.DEFAULT_GOAL := build

IMAGE ?= tensorflowbuilder:latest

.PHONY: build
build:
	@docker buildx create --use --name=crossplat --node=crossplat && \
	docker buildx build \
		--output "type=docker,push=false" \
		--tag $(IMAGE) \
		--file Dockerfile \
		.

.PHONY: run
run:
	docker run --env TF_PYTHON_VERSION=3.10 --mount source=bazelcache,target=/root/.cache/bazel --mount source=tfdata,target=/tensorflow -it tensorflowbuilder