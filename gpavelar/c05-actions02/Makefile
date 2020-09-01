COMPOSE_PATH = docker-compose.yml
COMPOSE_ENV = docker-compose -f ${COMPOSE_PATH}
COMPOSE_RUN = ${COMPOSE_ENV} run --rm
SHORT_SHA=${shell git rev-parse --short HEAD}
IMAGE ?= actions02
DH_USERNAME ?= gpavelar

##+MAKEFILE HELPER
##+
##+GENERAL COMMANDS
help: 				##+ Show Available commands.
	@fgrep -h "##+" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##+//'

##+
##+COMPOSE CMD
up:			##+ Builds the compose containers.
	${COMPOSE_ENV} up -d
down:   ##+ Downs the compose containers.
	${COMPOSE_ENV} down
build:			##+ Builds the compose containers.
	${COMPOSE_ENV} build
	
##+
##+ Docker build
##+
docker-build:
	@echo "Building Docker Image ${IMAGE}:${SHORT_SHA}"
	@docker build -t ${IMAGE}:${SHORT_SHA} .
.PHONY: docker-build

##+
##+ Docker push image
##+
docker-push: dh-login
	@echo "Publishing the container as ${DH_USERNAME}/${IMAGE}:${SHORT_SHA}"
	@docker tag ${IMAGE}:${SHORT_SHA} ${DH_USERNAME}/${IMAGE}:${SHORT_SHA}
	@docker push ${DH_USERNAME}/${IMAGE}:${SHORT_SHA}
.PHONY: docker-push

##+
##+ DockerHub login
##+
dh-login:
	@echo "Log in to a Docker registry"
	@docker login --username ${DH_USERNAME} --password ${GPAVELAR_DH_TOKEN}
.PHONY: dh-login