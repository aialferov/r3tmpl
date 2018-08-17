USER = aialferov
PROJECT = r3tmpl

VERSION = 0.3.0

REBAR3_HOME = ${HOME}/.config/rebar3

all:
	@echo "Usage: make install|uninstall"
	@echo "       make docker-<build|clean|distclean|push|release|release-local>"

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
	docker build . -t $(USER)/$(PROJECT):$(VERSION)

docker-clean:
	docker rmi $(USER)/$(PROJECT):$(VERSION)

docker-distclean: docker-clean
	docker rmi $(USER)/$(PROJECT):latest

docker-push:
	docker push $(USER)/$(PROJECT):$(VERSION)

docker-release: docker-release-local
	docker push $(USER)/$(PROJECT):latest

docker-release-local:
	docker tag $(USER)/$(PROJECT):$(VERSION) $(USER)/$(PROJECT):latest
