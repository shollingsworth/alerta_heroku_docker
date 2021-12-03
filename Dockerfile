FROM alerta/alerta-web:8.6.2

USER root

COPY ./entrypoint.sh /app/docker-entrypoint.sh
COPY ./entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY supervisord.conf /app/supervisord.conf
WORKDIR /app
USER alerta
