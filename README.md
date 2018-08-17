# Rebar3 Templates

[![License: MIT][MIT badge]][MIT]

Provides [Rebar3 Templates] for creating [Erlang] based project structures.

## Try

If you prefer to try it without installing localy, you can use [Docker]
container (Docker should be installed):

```
$ docker run --name r3tmpl --rm -it aialferov/r3tmpl
```

To learn more about the container see its image [Dockerfile].

Proceed to the [Usage] section if you wish to skip local installation.

## Install

Either clone this repository directly to the Rebar3 Templates folder:

```
$ git clone https://github.com/aialferov/r3tmpl ~/.config/rebar3
```

or use [Make] to install (but still need to clone to somewhere):

```
$ make install
```

Assuming you have Erlang already installed, [Rebar3] is also obviously needed to
use templates. Download and install:

```
$ wget https://s3.amazonaws.com/rebar3/rebar3
$ install rebar3 /usr/local/bin
```

## Usage

To create a project skeleton from template:

```
$ rebar3 new <Type> <Name>
```

The following types are supported:

- aalib — library template
- aacli — command line interface tool template
- aasvc — service executable template.

A project will be given a specified name.

### Example:

Let's create an Erlang based simple service:

```
$ rebar3 new aasvc mysvc
===> Writing mysvc/rebar3
===> Writing mysvc/rebar.config
===> Writing mysvc/Makefile
===> Writing mysvc/Dockerfile
===> Writing mysvc/README.md
===> Writing mysvc/src/mysvc.erl
===> Writing mysvc/src/mysvc_test.erl
===> Writing mysvc/src/mysvc.app.src
===> Writing mysvc/src/mysvc.app.src.script
===> Writing mysvc/priv/mysvc.config

$ tree mysvc
mysvc
├── Dockerfile
├── Makefile
├── README.md
├── priv
│   └── mysvc.config
├── rebar.config
├── rebar3
└── src
    ├── mysvc.app.src
    ├── mysvc.app.src.script
    ├── mysvc.erl
    └── mysvc_test.erl

2 directories, 10 files
```

You can already build and run the service:

```
$ cd mysvc
$ make
$ make run
```

The latter command executes the service binary located in "_build/default/bin"
directory after build. You can also run it manually.

If you run inside a Docker container started the way described in the [Try]
section, do not forget to copy the project (if you want to keep it) over your
host machine before exiting the shell:

```
$ docker cp r3tmpl:/mysvc ./
```

## Uninstall

The "uninstall" target removes only those files supplied within this repository
from the "~/.config/rebar3" folder and the folder itself if empty:

```
$ make uninstall
```

To remove the templates manually:

```
$ rm -rf ~/.config/rebar3/templates/aa{lib,cli,svc}*
$ rmdir -p ~/.config/rebar3/templates
```

<!-- Links -->
[MIT]: https://opensource.org/licenses/MIT
[Make]: https://www.gnu.org/software/make
[Docker]: https://docs.docker.com
[Erlang]: http://erlang.org
[Rebar3]: https://www.rebar3.org
[Rebar3 Templates]: https://www.rebar3.org/docs/using-templates
[Dockerfile]: Dockerfile

[Try]: #try
[Usage]: #usage

<!-- Badges -->
[MIT badge]: https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square
