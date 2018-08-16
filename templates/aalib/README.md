# {{name}}

An [Erlang] based library generated with [R3tmpl]. Documentation is in progress.

## Usage

Functionality documentation is in progress.

### Operations

[Make] interface is provided for operational purposes:

```
$ make             # build
$ make check       # run unit tests
$ make clean       # delete built "beam" files
$ make distclean   # as "clean" but also delete the "_build" folder
$ make shell       # get into an Erlang shell to invoke functions manually
$ make upgrade     # upgrade dependencies
$ make version     # show full version (i.e. library version plus git revision)
$ make git-release # create VERSION git tag and push to the git repository
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
