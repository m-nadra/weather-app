FROM alpine:3.22.4@sha256:310c62b5e7ca5b08167e4384c68db0fd2905dd9c7493756d356e893909057601
LABEL org.opencontainers.image.authors="Mikołaj Nadra <m.nadra@proton.me>"
RUN apk add --update --no-cache nginx curl

COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx index.html /usr/share/nginx/html/index.html
COPY --chown=nginx:nginx entrypoint.sh /
RUN chmod +x entrypoint.sh

HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost:3000/ || exit 1

USER nginx
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
