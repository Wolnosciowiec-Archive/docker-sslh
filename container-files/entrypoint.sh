#!/bin/bash

ARGS=""

if [[ "${SSL_TARGET}" ]]; then ARGS="$ARGS --tls=${SSL_TARGET} "; fi
if [[ "${SSH_TARGET}" ]]; then ARGS="$ARGS --ssh=${SSH_TARGET} "; fi
if [[ "${VPN_TARGET}" ]]; then ARGS="$ARGS --vpn=${VPN_TARGET} "; fi
if [[ "${HTTP_TARGET}" ]]; then ARGS="$ARGS --http=${HTTP_TARGET} "; fi
if [[ "${SOCKS_TARGET}" ]]; then ARGS="$ARGS --socks5=${SOCKS_TARGET} "; fi

docker_host=$(ip route | head -n 1 | awk '/default/ { print $3 }')
ARGS=${ARGS//{{ host \}\}/"${docker_host}"}
ARGS=${ARGS//{{host\}\}/"${docker_host}"}
ARGS=${ARGS//$'\n'/ }
ARGS="${ARGS} ${ADDITIONAL_ARGS}"

echo " >> Docker host IP address is '${docker_host}'"

set -x
eval "sslh-fork -f --transparent -p 0.0.0.0:4443 --user=sslh ${ARGS}"
