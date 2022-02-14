SHA = $(shell git rev-parse --short HEAD)
IMAGEID = "beardedsamwise/c05-actions02"

.PHONY: build
build:
	@echo "BUILDING DOCKER IMAGE WITH TAG $(IMAGEID):$(SHA)"
	@docker build -t $(IMAGEID):$(SHA) .

.PHONY: push
push:
	@echo "PUSHING DOCKER IMAGE TO DOCKER HUB WITH TAG c03-make01:$(SHA)"
	@docker push $(IMAGEID):$(SHA)

.PHONY: login
login:
	@echo "LOGGING IN TO DOCKER HUB..."
	@docker login -u beardedsamwise -p $(BEARDED_DOCKER)

.PHONY: all
all: login build push

.PHONE: test
test: build push
