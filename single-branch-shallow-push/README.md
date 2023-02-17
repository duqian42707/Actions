# Single Branch shallow-push

```yaml
name: Deploy to Github Pages and Gitee Pages
on:
  push:
    branches:
      - master
jobs:
  mirroring-gitee:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Branch gh-pages
        uses: actions/checkout@v3
        with:
          ref: 'gh-pages'
          fetch-depth: 1
      - name: Deploy to Gitee Pages
        uses: duqian42707/actions/single-branch-shallow-push@master
        with:
          target_repo_url: git@gitee.com:dq07/blog.git
          ssh_private_key: ${{ secrets.GITEE_SSH_PRIVATE_KEY }}
```
