Exercise c05-actions02

Dockerfile alpine:3.7


## Test build-push-action

```
name: lgothelipe-c05-actions02
on:
  pull_request:
    paths: 
        - 'lgothelipe/**'
jobs:
  push_to_registry:
    name: Push Docker image to Docker Hub
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repo
        uses: actions/checkout@v2
      - name: Push to Docker Hub
        uses: docker/build-push-action@v1
        with:
          username: ${{ secrets.LG_DOCKER_USERNAME }}
          password: ${{ secrets.LG_DOCKER_PASSWORD }}
          repository: lgothelipe/c05-image
          tag_with_sha: true
          dockerfile: lgothelipe/c05-actions02/Dockerfile
```

## Using 3M

```
name: lgothelipe-c05-actions02
on:
    pull_request:
      paths: 
          - lgothelipe/**
jobs:
  build:
    runs-on: ubuntu-latest
    env:
        SHORT_SHA: ${GITHUB_SHA::6}
        IMAGE_NAME: c05-image
    steps:
    - uses: actions/checkout@v2
    - name: Build the Docker image
      run: docker build . --file lgothelipe/c05-actions02/Dockerfile --tag $IMAGE_NAME:$SHORT_SHA
    - name: Log into docker hub
      run: docker login -u ${{ secrets.LG_DOCKER_USERNAME }} -p ${{ secrets.LG_DOCKER_PASSWORD }}
    - name: Push image
      run: |
        docker tag $IMAGE_NAME:$SHORT_SHA ${{ secrets.LG_DOCKER_USERNAME }}/$IMAGE_NAME:$SHORT_SHA
        docker push ${{ secrets.LG_DOCKER_USERNAME }}/$IMAGE_NAME:$SHORT_SHA
```
