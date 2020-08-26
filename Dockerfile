FROM alpine:edge

ENV SSL_TARGET="{{ host }}:443" \
    SSH_TARGET="{{ host }}:22" \
    VPN_TARGET="" \
    HTTP_TARGET="" \
    SOCKS_TARGET="" \
    ADDITIONAL_ARGS=""

RUN addgroup -S sslh && adduser -S -G sslh sslh \
    && apk add --update -X http://dl-cdn.alpinelinux.org/alpine/edge/testing sslh bash \
    && setcap cap_net_bind_service,cap_net_admin+pe /usr/sbin/sslh-select \
    && chmod +x /usr/sbin/sslh-select

ADD ./container-files/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
