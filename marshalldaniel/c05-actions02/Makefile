export SHORT_COMMIT_SHA = $(shell git rev-parse --short HEAD)
export IMAGE_NAME = 'marshalldaniel/c05-actions02'
export FULL_IMAGE_NAME = $(IMAGE_NAME):$(SHORT_COMMIT_SHA)
DOCKER_COMPOSE = docker-compose build
DOCKERHUB_PUSH = docker push $(IMAGE_NAME):$(SHORT_COMMIT_SHA)

all: build_image push_image

.PHONY: build_image
build_image:
	$(DOCKER_COMPOSE)

.PHONY: login_dockerhub
login_dockerhub:
	@echo $(MARSHALLDANIEL_DH_TOKEN) | docker login -u $(MARSHALLDANIEL_DH_NAME) --password-stdin 

.PHONY: push_image
push_image:
	$(DOCKERHUB_PUSH)
	echo $(FULL_IMAGE_NAME) >> $(GITHUB_ENV)