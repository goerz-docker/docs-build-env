build:
	docker build --progress plain --target base -t docker.pkg.github.com/goerz-docker/docs-build-env/docs-build-env:latest .
	docker build --progress plain --target scientific -t docker.pkg.github.com/goerz-docker/docs-build-env/docs-build-env:scientific .

push:
	docker push docker.pkg.github.com/goerz-docker/docs-build-env/docs-build-env:latest
	docker push docker.pkg.github.com/goerz-docker/docs-build-env/docs-build-env:scientific

.PHONY: build push
