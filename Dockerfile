FROM kong:1.0.3-alpine
COPY kongredirect.kong.conf /etc/kong/kongredirect.kong.conf

ENV KONG_DATABASE=postgres
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_LISTEN=0.0.0.0:8001

ENV KONG_NGINX_HTTP_INCLUDE=/etc/kong/kongredirect.kong.conf

