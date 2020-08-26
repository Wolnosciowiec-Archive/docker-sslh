SSLH - a protocol multiplexer in a docker container
===================================================

Example usage:

```yaml
version: "3.4"

services:
    sslh:
        image: quay.io/riotkit/sslh:1.20-r3
        ports:
            - 4443:4443
        cap_add:
            - cap_net_admin
        network_mode: host
        environment:
            HTTP_TARGET: "127.0.0.1:8000"
            SSL_TARGET: "127.0.0.1:443"
            #VPN_TARGET: ""
            #HTTP_TARGET: ""
            #SOCKS_TARGET: ""
            #ADDITIONAL_ARGS: "-v"

```
