# Rebar3 Templates

[![License: MIT][MIT badge]][MIT]

Provides [Rebar3 Templates] for creating Erlang based project structures.

## Install

Either clone this repository directly to the Rebar3 Templates folder:

```
$ git clone https://github.com/aialferov/r3tmpl ~/.config/rebar3
```

or use [Make] to install (but still need to clone to somewhere):

```
$ make install
```

## Usage

[Rebar3] is obviously needed to use templates. Download and install:

```
$ wget https://s3.amazonaws.com/rebar3/rebar3
$ install rebar3 /usr/local/bin
```

To create a project skeleton from template:

```
$ rebar3 new <Type> <Name>
```

The following types are supported:

- aalib — library template
- aacli — command line tool template.

A project will be given a specified name.

### Example:

Let's create an Erlang based simple command line tool:

```
$ rebar3 new aacli mycli
===> Writing mycli/rebar3
===> Writing mycli/rebar.config
===> Writing mycli/Makefile
===> Writing mycli/Dockerfile
===> Writing mycli/README.md
===> Writing mycli/src/mycli.erl
===> Writing mycli/src/mycli_test.erl
===> Writing mycli/src/mycli.app.src
===> Writing mycli/src/mycli.app.src.script
===> Writing mycli/priv/mycli.config

$ tree mycli
mycli
├── Dockerfile
├── Makefile
├── README.md
├── priv
│   └── mycli.config
├── rebar.config
├── rebar3
└── src
    ├── mycli.app.src
    ├── mycli.app.src.script
    ├── mycli.erl
    └── mycli_test.erl

2 directories, 10 files
```

## Uninstall

The [Make] "uninstall" target removes only those files supplied within this
repository from the "~/.config/rebar3" folder and the folder itself if empty:

```
$ make uninstall
```

To remove the templates manually:

```
$ rm -rf ~/.config/rebar3/templates/aa{cli,lib}*
$ rmdir -p ~/.config/rebar3/templates
```

<!-- Links -->
[MIT]: https://opensource.org/licenses/MIT
[Rebar3]: https://www.rebar3.org
[Rebar3 Templates]: https://www.rebar3.org/docs/using-templates
[Make]: https://www.gnu.org/software/make

<!-- Badges -->
[MIT badge]: https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square
