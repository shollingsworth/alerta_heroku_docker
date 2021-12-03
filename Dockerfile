FROM alerta/alerta-web:8.6.2

USER root

COPY ./nginx.conf.j2 /app/nginx.conf.j2
WORKDIR /app
USER alerta
