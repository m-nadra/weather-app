# syntax=docker/dockerfile:1
FROM alpine:3.22.4@sha256:310c62b5e7ca5b08167e4384c68db0fd2905dd9c7493756d356e893909057601 AS base
RUN apk add --no-cache openssh-client git
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR /app
RUN --mount=type=ssh,id=github git clone git@github.com:m-nadra/weather-app.git .
RUN chmod +x entrypoint.sh
CMD ["/bin/sh"]



FROM alpine:3.22.4@sha256:310c62b5e7ca5b08167e4384c68db0fd2905dd9c7493756d356e893909057601
LABEL org.opencontainers.image.authors="Mikołaj Nadra <m.nadra@proton.me>"
RUN apk add --update --no-cache nginx curl

COPY --from=base --chown=nginx:nginx /app/nginx.conf /etc/nginx/nginx.conf
COPY --from=base --chown=nginx:nginx /app/index.html /usr/share/nginx/html/index.html
COPY --from=base --chown=nginx:nginx /app/entrypoint.sh /

HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost:3000/ || exit 1

USER nginx
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]