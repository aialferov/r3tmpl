USER = {{user}}
PROJECT = {{name}}

VERSION = $(shell cat src/$(PROJECT).app.src | grep vsn | cut -d\" -f2)
GIT_SHA = $(shell git rev-parse HEAD | cut -c1-8)

REBAR = $(shell which ./rebar3 || which rebar3)

BASE_PATH = $(shell QUIET=1 $(REBAR) path --base)
PLUGIN_BEAMS = $(BASE_PATH)/plugins/*/ebin/*.beam

PREFIX = usr/local

BIN_DIR = bin
BIN_PATH = $(DEST_DIR)/$(PREFIX)/$(BIN_DIR)
BIN_PATH_IN = $(BASE_PATH)/bin

IMAGE = $(USER)/$(PROJECT):$(VERSION)
IMAGE_LATEST = $(USER)/$(PROJECT):latest

compile:
	$(REBAR) compile
	$(REBAR) unlock

check:
	$(REBAR) eunit

clean:
	$(REBAR) clean -a
	rm -f $(PLUGIN_BEAMS)

distclean:
	rm -rf _build

install:
	mkdir -p $(BIN_PATH)
	install -p $(BIN_PATH_IN)/$(PROJECT) $(BIN_PATH)

uninstall:
	rm -f $(BIN_PATH)/$(PROJECT)
	rmdir -p $(BIN_PATH) 2>/dev/null || true

shell:
	$(REBAR) shell
	$(REBAR) unlock

upgrade:
	$(REBAR) upgrade
	$(REBAR) unlock

run:
	$(BIN_PATH_IN)/$(PROJECT) run

join:
	erl \
		-start_epmd false \
		-remsh $(PROJECT)@localhost \
		-sname $(PROJECT)-$$RANDOM \
		-setcookie $(PROJECT)

git-release:
	git tag -a $(VERSION)
	git push origin $(VERSION)

version:
	@echo "Version $(VERSION) (git-$(GIT_SHA))"

erlang-compile: compile
	$(REBAR) erlang
	$(REBAR) unlock

erlang-clean:
	rm -rf _build/default/erl

erlang-install:
	$(MAKE) -C _build/default/erl install PREFIX=$(PREFIX)

docker-ready: clean compile install \
			  erlang-clean erlang-compile erlang-install

docker-build:
	docker build . -t $(IMAGE)

docker-push:
	docker push $(IMAGE)

docker-release: docker-release-local
	docker push $(IMAGE_LATEST)

docker-release-local:
	docker tag $(IMAGE) $(IMAGE_LATEST)

docker-run:
	docker run \
		--rm -it \
		--name $(PROJECT) \
		-v ${PWD}/priv:/etc/$(PROJECT) \
		$(IMAGE) run

docker-start:
	docker run \
		--rm -itd \
		--name $(PROJECT) \
		-v ${PWD}/priv:/etc/$(PROJECT) \
		$(IMAGE) run

docker-stop:
	docker stop $(PROJECT)

docker-join:
	docker exec \
		-it $(PROJECT) \
		erl \
			-start_epmd false \
			-remsh $(PROJECT)@localhost \
			-sname $(PROJECT)-$$RANDOM \
			-setcookie $(PROJECT)

docker-shell:
	docker exec -it $(PROJECT) sh

docker-attach:
	docker attach $(PROJECT)

docker-logs:
	docker logs $(PROJECT)

docker-logs-f:
	docker logs -f $(PROJECT)

docker-clean:
	docker rmi $(IMAGE)

docker-distclean: docker-clean
	docker rmi $(IMAGE_LATEST)
