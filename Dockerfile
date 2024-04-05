FROM alpine as builder

ARG OPENFORTIVPN_VERSION=v1.21.0

# Build openfortivpn binary
RUN apk add --no-cache \
        openssl-dev \
        ppp \
        ca-certificates \
        curl \
    && apk add --no-cache --virtual .build-deps \
        automake \
        autoconf \
        g++ \
        gcc \
        make \
    && mkdir -p "/usr/src/openfortivpn" \
    && cd "/usr/src/openfortivpn" \
    && curl -Ls "https://github.com/adrienverge/openfortivpn/archive/${OPENFORTIVPN_VERSION}.tar.gz" \
        | tar xz --strip-components 1 \
    && aclocal \
    && autoconf \
    && automake --add-missing \
    && ./configure --prefix=/usr --sysconfdir=/etc \
    && make \
    && make install \
    && apk del .build-deps

FROM nadoo/glider:latest as glider

FROM alpine

RUN apk add ca-certificates openssl ppp supervisor

COPY --from=builder /etc/ppp /etc/ppp
COPY --from=builder /usr/bin/openfortivpn /usr/bin/openfortivpn
COPY --from=glider /app/glider /usr/bin/glider
COPY supervisord.conf /etc/supervisor/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]