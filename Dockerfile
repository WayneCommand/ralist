FROM xhofe/alist:v3.33.0

RUN apk update && \
    apk upgrade --no-cache && \
    apk add caddy; \
    rm -rf /var/cache/apk/*


RUN rm -rf entrypoint.sh

# copy web server config
COPY config/Caddyfile /etc/caddy/Caddyfile
COPY config/entrypoint.sh ./entrypoint.sh 

CMD [ "/entrypoint.sh" ]

EXPOSE 10000