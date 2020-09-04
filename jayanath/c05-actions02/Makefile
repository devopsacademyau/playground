COMPOSE_BUILD = docker-compose build 3m_run
COMPOSE_RUN = docker-compose run -e SHA=$(shell git rev-parse --short HEAD) --rm 3m_run

init:
	$(COMPOSE_BUILD)

build: init
	$(COMPOSE_RUN) make _build

push:
	$(COMPOSE_RUN) make _push

cleanDocker:
	docker-compose down --remove-orphans

clean: cleanDocker
	rm -f .env

_build:
	bash scripts/docker_build.sh

_push:
	bash scripts/docker_push.sh
