FROM alpine:3.12.2
RUN apk --no-cache add  openvpn==2.4.12-r0 
RUN apk --no-cache add \
    gettext \
    nginx \
    curl \
    wget \
    privoxy \
    runit

COPY app /app

ENV LOCAL_NETWORK= \
    OPENVPN_AUTO_CONFIG=true \
    OPENVPN_CONFIG_FILE=/config/config.ovpn \
    OPENVPN_HOST=localhost \
    OPENVPN_PASSWORD= \
    OPENVPN_PROXY_PORT=8080 \
    OPENVPN_TUNNEL_HOSTS= \
    OPENVPN_USERNAME=

CMD ["runsvdir", "/app"]
