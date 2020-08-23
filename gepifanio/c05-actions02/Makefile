NAME ?= Guilherme
COMMIT_SHA ?= ${shell git rev-parse --short HEAD}
IMAGE_NAME ?= c05-actions02
DOCKER_HUB_USERNAME ?= guiepifanio

all: login build push
.PHONY: all

login: 
	docker login --username $(DOCKER_HUB_USERNAME) --password $(GEPIFANIO_DOCKER_ACCESS_TOKEN)
.PHONY: login

build:
	echo "This image was created by ${NAME} based on the ${COMMIT_SHA}" > index.html
	docker build -t ${IMAGE_NAME}:${COMMIT_SHA} .
	docker tag ${IMAGE_NAME}:${COMMIT_SHA} ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${COMMIT_SHA}
.PHONY: build

push:
	docker push ${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${COMMIT_SHA}
.PHONY: push