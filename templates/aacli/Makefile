include mk/Erlangbin.mk
include mk/Docker.mk

USER = {{user}}

ifdef ERLANG_VERSION
	DOCKER_BUILD_ARGS_EXTRA = --build-arg ERLANG_VERSION=$(ERLANG_VERSION)
endif
