# gcr.io images Sync

## Usage

```yaml
name: gcr.io image sync
on:
  schedules:
  - cron: 0 */6 * * *
jobs:
  k8s-image-sync:
    name: gcr.io image sync
    runs-on: ubuntu-latest
    steps:
    - name: sync
      uses: duqian42707/actions/gcr-io-image-sync@main
      with:
        images: |
          k8s.gcr.io/kube-controller-manager:v1.18.8
          k8s.gcr.io/kube-scheduler:v1.18.8
          k8s.gcr.io/kube-proxy:v1.18.8
          k8s.gcr.io/kube-apiserver:v1.18.8
          k8s.gcr.io/coredns:1.6.7
          k8s.gcr.io/etcd:3.4.3-0
          k8s.gcr.io/pause:3.2
          k8s.gcr.io/metrics-server/metrics-server:v0.3.7
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}
        namespace: duqk8simg
```
