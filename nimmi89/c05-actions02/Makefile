# Makefile
# COMPOSE_RUN_EXERCISE = docker-compose run --rm c05-actions02

TAG = $(shell git rev-parse --short HEAD) 


.PHONY: build_push
build_push: build push


.PHONY: build
build: ## Build the container
	@echo 'BUILDING THE IMAGE'
	docker build -t c05-actions-image:$(TAG) .

.PHONY: push
push: ## Publish the image to docker hub
	@echo 'PUBLISHING THE IMAGE TO DOCKER HUB'
	docker tag c05-actions-image:$(TAG) netizen89/c05-actions-image:$(TAG)
	docker push netizen89/c05-actions-image:$(TAG)


