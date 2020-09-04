echo "Building docker image with SHA tag: ${SHA}"
docker build -t ${DOCKER_HUB_USER}/3m-rocks:${SHA} .
