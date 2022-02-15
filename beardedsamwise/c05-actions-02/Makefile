SHA = $(shell git rev-parse --short HEAD)
IMAGEID = "beardedsamwise/c05-actions02"
export BEARDED_DOCKER

.PHONY: build
build:
	@echo "BUILDING DOCKER IMAGE WITH TAG $(IMAGEID):$(SHA)"
	docker build -t $(IMAGEID):$(SHA) .

.PHONY: push
push:
	@echo "PUSHING DOCKER IMAGE TO DOCKER HUB WITH TAG c03-make01:$(SHA)"
	docker push $(IMAGEID):$(SHA)

.PHONY: login
login:
	echo "LOGGING IN TO DOCKER HUB..."
	@echo $(BEARDED_DOCKER) | docker login --username beardedsamwise --password-stdin
	
.PHONY: output
output:
	echo "FULLIMAGEID=$(IMAGEID):$(SHA)" >> $(GITHUB_ENV)

all: 
	login build push

test: 
	build push
