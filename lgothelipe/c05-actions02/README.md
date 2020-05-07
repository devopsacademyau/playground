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
        IMAGE_NAME: c05-image
    steps:
    - uses: actions/checkout@v2
    - name: Build the Docker image
      run: docker build -t $IMAGE_NAME:test123 -f lgothelipe/c05-actions02/Dockerfile
    - name: Log into docker hub
      run: docker login -u ${{ secrets.LG_DOCKER_USERNAME }} -p ${{ secrets.LG_DOCKER_PASSWORD }}
    - name: Push image
      run: |
        docker tag $IMAGE_NAME:test123 ${{ secrets.LG_DOCKER_USERNAME }}/$IMAGE_NAME:test123
        docker push ${{ secrets.LG_DOCKER_USERNAME }}/$IMAGE_NAME:test123
  comment:
    runs-on: ubuntu-latest
    env:
      IMAGE_NAME: c05-image
    steps:
      - uses: mshick/add-pr-comment@v1
        with:
          repo-token: ${{ secrets.LG_GITHUB_TOKEN }}
          message: Image name $IMAGE_NAME:test123
          allow-repeats: false
```
