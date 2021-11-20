FROM alerta/alerta-web:8.5.0

USER root

COPY ./entrypoint.sh /app/docker-entrypoint.sh
COPY ./entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ./nginx_mod.py /app/nginx_mod.py
COPY supervisord.conf /app/supervisord.conf
WORKDIR /app
USER alerta
