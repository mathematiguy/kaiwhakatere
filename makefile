REPO_NAME := $(shell basename `git rev-parse --show-toplevel` | tr '[:upper:]' '[:lower:]')
GIT_TAG ?= $(shell git log --oneline | head -n1 | awk '{print $$1}')
DOCKER_REGISTRY := mathematiguy
IMAGE := $(DOCKER_REGISTRY)/$(REPO_NAME)
HAS_DOCKER ?= $(shell which docker)
RUN ?= $(if $(HAS_DOCKER), docker run $(DOCKER_ARGS) -it --rm -v $$(pwd):/code -w /code -u $(UID):$(GID) $(IMAGE))
UID ?= user
GID ?= user
DOCKER_ARGS ?=

.PHONY: docker docker-push docker-pull enter enter-root

runserver: DOCKER_ARGS=-p 8000:8000
runserver:
	$(RUN) python3 manage.py runserver 0.0.0.0:8000

install:
	echo Installing npm pacakges
	$(RUN) npm install postcss tailwindcss autoprefixer postcss-simple-vars

docker:
	docker build $(DOCKER_ARGS) --tag $(IMAGE):$(GIT_TAG) .
	docker tag $(IMAGE):$(GIT_TAG) $(IMAGE):latest

docker-push:
	docker push $(IMAGE):$(GIT_TAG)
	docker push $(IMAGE):latest

docker-pull:
	docker pull $(IMAGE):$(GIT_TAG)
	docker tag $(IMAGE):$(GIT_TAG) $(IMAGE):latest

enter:
	$(RUN) bash

enter-root: UID=root
enter-root: GID=root
enter-root:
	$(RUN) bash
