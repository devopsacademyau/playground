TAG = $(shell git rev-parse --short HEAD) 
DOCKER_LOGIN=mail2kvanitha

.PHONY: login
login: 
	@echo "Docker Hub Login"
	@docker login --username $(DOCKER_LOGIN) -p $(DOCKER_PASS) ; if [ $$? -eq 0 ]; then \
	                                                    echo "Docker Login Successful " ; \
                                                         else  \
                                                            echo "Unable to login to Docker Hub. Please check Login details" ; \
                                                         fi

.PHONY: build
build:
	@echo "Docker build"
	@docker build -t $(DOCKER_LOGIN)/my-image:$(TAG) . ; if [ $$? -eq 0 ]; then \
									echo "Docker image build successful" ; docker images ; \
								else \
									echo "Docker build Failed. Please check Dockerfile" ; \
								fi

.PHONY: push
push: login
	@echo "Pushing Docker Image $(DOCKER_LOGIN)/my-image:$(TAG)"
	@docker push $(DOCKER_LOGIN)/my-image:$(TAG) ; if [ $$? -eq 0 ]; then \
								echo "Docker Image pushed successfully" ; \
							else \
								echo "Unable to push the Docker Image to Docker Hub" ; \
							fi
