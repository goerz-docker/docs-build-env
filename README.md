# docs-build-env Docker environment

Docker image for building Sphinx documentation.


## Usage

In a Github Actions workflow file, use this image as a job-level "container".
For example:

~~~
name: Docs

on: [push, ]

jobs:

  build_docs:
    name: Build Sphinx docs
    runs-on: ubuntu-18.04
    container:
      image: docker.pkg.github.com/goerz-testing/docs-build-env-docker/docs-build-env-docker:scientific
      credentials:
        username: ${{ github.repository_owner }}
        password: ${{ secrets.GITHUB_TOKEN }}

    steps:

      - uses: actions/checkout@v2

      - name: Build the docs
        run: |
          set -x
          python -m pip install -e .[dev]
          python -m sphinx -W "docs/sources/" -d "docs/_build/doctree" "docs/_build/html"
~~~
