# gcr.io images Sync

## Usage

```yaml
name: docker image sync
on:
  workflow_dispatch:
    inputs:
      images:
        description: "docker image"
        required: true
        default: "docker.io/library/nginx:latest"
jobs:
  k8s-image-sync:
    name: gcr.io image sync
    runs-on: ubuntu-latest
    steps:
    - name: sync
      uses: duqian42707/actions/docker-image-transfer@main
      with:
        images: ${{ github.event.inputs.images }}
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}
        registry: swr.cn-north-4.myhuaweicloud.com
        namespace: dqv5
```
