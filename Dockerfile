FROM alpine

RUN apk upgrade --no-cache --update && \
    apk add --no-cache \
        git \
        vim \
        make \
        erlang \
        erlang-dev \
        erlang-ssl \
        erlang-asn1 \
        erlang-sasl \
        erlang-inets \
        erlang-eunit \
        erlang-tools \
        erlang-crypto \
        erlang-public-key \
        erlang-syntax-tools

RUN wget https://s3.amazonaws.com/rebar3/rebar3 && \
    install rebar3 /usr/local/bin && \
    rm rebar3

COPY templates /root/.config/rebar3/templates
COPY bin /usr/local/bin
