# Makefile
# COMPOSE_RUN_EXERCISE = docker-compose run --rm c05-actions02

TAG = $(shell git rev-parse --short HEAD) 
DOCKER_REGISTRY = netizen89


.PHONY: build_push
build_push: build push

.PHONY: login
login: #Login into docker hub
	@echo 'Login into docker hub'
	docker login -u $(DOCKER_REGISTRY) -p $DOCKER_PASSWORD


.PHONY: build
build: ## Build the container
	@echo 'BUILDING THE IMAGE'
	docker build -t $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(TAG) .

.PHONY: push
push: ## Publish the image to docker hub
	@echo 'PUBLISHING THE IMAGE TO DOCKER HUB'
	docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(TAG)


