FROM aialferov/r3tmpl AS builder

COPY . src
RUN make -C src docker-ready PREFIX=build

FROM aialferov/erlang-ready:basic

COPY --from=builder /build /usr

ENTRYPOINT ["/usr/bin/{{name}}"]
