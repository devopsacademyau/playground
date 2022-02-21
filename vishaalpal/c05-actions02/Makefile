export SC_SHA = $(shell git rev-parse --short HEAD)
export IMAGE_NAME = vee94/c05-actions02
export FULL_IMAGE_NAME = "$(IMAGE_NAME):$(SC_SHA)"
DOCKER_COMPOSE = docker-compose build
DOCKERHUB_PUSH = docker push $(IMAGE_NAME):$(SC_SHA)

all: build_image push_image

.PHONY: build_image
build_image:
	$(DOCKER_COMPOSE)

.PHONY: login_dockerhub
login_dockerhub:
	@echo $(VISHAALPAL_DH_TOKEN) | docker login -u $(VISHAALPAL_DH_USERNAME) --password-stdin

.PHONY: push_image
push_image:
	$(DOCKERHUB_PUSH)
	echo "FULLIMAGEID=$(IMAGE_NAME):$(SC_SHA)" >> $(GITHUB_ENV) 