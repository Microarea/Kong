FROM kong:2.8.0-alpine

COPY docker-entrypoint-new.sh /docker-entrypoint-new.sh

COPY kongredirect.kong.conf /etc/kong/kongredirect.kong.conf

COPY nginx.conf /nginx.conf

USER root

RUN apk add --no-cache bash su-exec

RUN apk add --update tini

RUN chmod +x /docker-entrypoint-new.sh

ENTRYPOINT ["/docker-entrypoint-new.sh"]

ENV KONG_NGINX_READ_TIMEOUT=120000

CMD ["kong", "docker-start"]
