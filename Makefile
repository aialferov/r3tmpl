REBAR3_HOME = ${HOME}/.config/rebar3

all:
	@echo "Usage: make install"

install:
	find templates -type d -exec mkdir -p "$(REBAR3_HOME)/{}" \;
	find templates -type f -exec install -m 644 "{}" "$(REBAR3_HOME)/{}" \;
