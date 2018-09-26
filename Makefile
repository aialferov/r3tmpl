REGISTRY = docker.io
USER = aialferov
PROJECT = r3tmpl
VERSION = 0.6.1

IMAGE = $(REGISTRY)/$(USER)/$(PROJECT):$(VERSION)
IMAGE_LATEST = $(REGISTRY)/$(USER)/$(PROJECT):latest

REBAR3_HOME = ${HOME}/.config/rebar3

usage:
	@echo "Usage: make <Command>"
	@echo
	@echo "Commands"
	@echo "    install"
	@echo "    uninstall"
	@echo "    git-release"
	@echo "    docker-build"
	@echo "    docker-clean"
	@echo "    docker-distclean"
	@echo "    docker-push"
	@echo "    docker-release"
	@echo "    docker-local-release"

install:
	find templates -type d -exec mkdir -p "$(REBAR3_HOME)/{}" \;
	find templates -type f -exec install -m 644 "{}" "$(REBAR3_HOME)/{}" \;

uninstall:
	find templates -type f -exec rm "$(REBAR3_HOME)/{}" 2>/dev/null \;
	find templates -type d -exec rmdir -p "$(REBAR3_HOME)/{}" 2>/dev/null \;

git-release:
	git tag -a $(VERSION)
	git push origin $(VERSION)

docker-build:
	docker build . -t $(IMAGE)

docker-clean:
	docker rmi $(IMAGE)

docker-distclean: docker-clean
	docker rmi $(IMAGE_LATEST)

docker-push:
	docker push $(IMAGE)

docker-release: docker-local-release
	docker push $(IMAGE_LATEST)

docker-local-release:
	docker tag $(IMAGE) $(IMAGE_LATEST)
