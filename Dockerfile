FROM alerta/alerta-web:8.5.0

USER root

COPY ./nginx_wrap.py /app/nginx_wrap.py
COPY supervisord.conf /app/supervisord.conf
WORKDIR /app
USER alerta
