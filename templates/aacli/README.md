# {{name}}

An [Erlang] based service generated with [R3tmpl]. Documentation is in progress.

## Usage

Functionality documentation is in progress.

### Operations

[Make] interface is provided for operational purposes:

```
$ make [compile]   # compile (build) the service
$ make check       # run unit tests
$ make clean       # delete built "beam" files
$ make distclean   # delete the "_build" folder
$ make shell       # get into an Erlang shell with all the modules loaded
$ make upgrade     # upgrade dependencies
$ make run         # run the built binary
$ make join        # join to the running Erlang shell
$ make git-release # create git tag of the current version and push
$ make version     # show full version (i.e. library version plus git revision)
```

### Dependencies

Edit "deps" section of [rebar.config] to add an Erlang dependency:

```
{deps, [
    {deplib, {git, "https://github.com/username/deplib", {tag, "master"}}}
]}.
```

<!-- Links -->

[Erlang]: http://erlang.org
[R3tmpl]: https://github.com/aialferov/r3tmpl
[Make]: https://www.gnu.org/software/make
[rebar.config]: rebar.config
