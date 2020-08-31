# C05-ACTIONS01

## Commands

```yml
# This workflow will deploy a new task definition to Amazon ECS based on the image pushed to ECR, when a merge is created

name: GPAVELAR/C05-ACTIONS01
on:
  pull_request:
    branches:
    - master
    paths: 'gpavelar/**'

jobs:
  comment:
    name: Deploy
    runs-on: ubuntu-latest
    
    steps:
    - name: Comment on PR
      uses: mshick/add-pr-comment@v1
      env:
        MY_NAME: ${{ secrets.GPAVELAR_USERNAME }}
        GITHUB_TOKEN: ${{ secrets.GPAVELAR_PAT }}
      with:
        message: "Well done $MY_NAME ! This is a nice PR"
        repo-token: $GITHUB_TOKEN
        repo-token-user-login: 'github-actions[bot]'
        allow-repeats: false

```