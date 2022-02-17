export SHORT_COMMIT_SHA = $(shell git rev-parse --short HEAD)
export IMAGE_NAME = $(shell git rev-parse --abbrev-ref HEAD)
DOCKER_COMPOSE = docker-compose build
DOCKERHUB_PUSH = docker push $(IMAGE_NAME):$(SHORT_COMMIT_SHA)

all: build_image push_image

.PHONY: build_image
build_image:
	$(DOCKER_COMPOSE)

.PHONY: login_dockerhub
login_dockerhub:
	@echo ${ MARSHALLDANIEL_DH_TOKEN } | docker login -u ${ MARSHALLDANIEL_DH_NAME } --password-stdin 

.PHONY: push_image
push_image:
	$(DOCKERHUB_PUSH)
