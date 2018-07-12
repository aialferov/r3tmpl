FROM alpine
RUN apk --update --no-cache add erlang

ADD bin /bin
ENTRYPOINT ["/bin/{{name}}"]
