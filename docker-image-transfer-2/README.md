# gcr.io images Sync

## Usage

```yaml
name: docker image sync
on:
  workflow_dispatch:
    inputs:
      TRANSFER_RULE:
        description: "TRANSFER_RULE"
        required: true
        default: "library/nginx:1.27.0 : swr.cn-north-4.myhuaweicloud.com/library/nginx:1.27.0"
jobs:
  k8s-image-sync:
    name: gcr.io image sync
    runs-on: ubuntu-latest
    steps:
    - name: sync
      uses: duqian42707/actions/docker-image-transfer-2@main
      with:
        REGISTRY_SECRET: ${{ secrets.REGISTRY_SECRET }}
        TRANSFER_RULE: ${{ github.event.inputs.TRANSFER_RULE }}
```
