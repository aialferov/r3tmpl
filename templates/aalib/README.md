# {{name}}

An [Erlang] based library generated with [r3tmpl].
Documentation is in progress.

## Usage

Functionality documentation is in progress.

### Operations

[Make] interface is provided for operational purposes:

```
$ make           # build
$ make check     # run unit tests
$ make shell     # get into an Erlang shell to invoke functions manually
$ make version   # show full version (i.e. library version plus git revision)
$ make upgrade   # upgrade dependencies
$ make clean     # delete built "beam" files
$ make distclean # as "clean" but also delete "_build" folder
```

### Dependencies

Edit "deps" section of [rebar.config] to add an Erlang dependency:

```
{deps, [
    {deplib, {git, "git://github.com/username/deplib", {tag, "master"}}}
]}.
```

<!-- Links -->

[Erlang]: http://erlang.org
[r3tmpl]: https://github.com/aialferov/r3tmpl
[Make]: https://www.gnu.org/software/make
[rebar.config]: rebar.config
