#vars


.PHONY: build push login 

build:
		@echo "Building image with tag ${IMAGEFULLNAME}"
	    @docker build -t ${IMAGEFULLNAME} -f chisholm-ray/actions02/Dockerfile .

push:
		@echo "Pushing image with tag ${IMAGEFULLNAME} to DockerHub"
	    @docker image push ${IMAGEFULLNAME}

login:
		@echo "Logging into DockerHub with provided credentials"
		@echo ${CCR_DOCKERP} | docker login -u ${CCR_DOCKERU} --password-stdin