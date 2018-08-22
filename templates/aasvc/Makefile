USER = {{user}}
PROJECT = {{name}}

DOCKER_RUN_ARGS_EXTRA = \
    -v ${PWD}/priv:/var/run/$(PROJECT)/priv \
    -w /var/run/$(PROJECT)

ifdef ERLANG_VERSION
    DOCKER_BUILD_ARGS_EXTRA = \
        --build-arg ERLANG_VERSION=$(ERLANG_VERSION)
endif

include mk/Erlangbin.mk
include mk/Docker.mk
