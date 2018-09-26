ARG ERLANG_VERSION=latest
FROM aialferov/erlang:$ERLANG_VERSION AS builder
LABEL project={{name}}

COPY . src
RUN make -C src package-ready DESTDIR=/build

FROM alpine
LABEL project={{name}}
RUN apk add --no-cache --update ncurses

COPY --from=builder /build /

ENTRYPOINT ["/usr/local/bin/{{name}}"]
