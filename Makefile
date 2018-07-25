REBAR3_HOME = ${HOME}/.config/rebar3

all:
	@echo "Usage: make install"

install:
	find templates -type d -exec mkdir -p "$(REBAR3_HOME)/{}" \;
	find templates -type f -exec install -m 644 "{}" "$(REBAR3_HOME)/{}" \;

uninstall:
	find templates -type f -exec rm "$(REBAR3_HOME)/{}" 2>/dev/null \;
	find templates -type d -exec rmdir -p "$(REBAR3_HOME)/{}" 2>/dev/null \;
