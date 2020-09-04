echo "Pushing docker image to docker hub"
docker login --username ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
docker push ${DOCKER_HUB_USER}/3m-rocks:${SHA}