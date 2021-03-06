#!/bin/bash
# /usr/local/bin/docker-entrypoint.sh

set -ex

env | sort

INIT=0

###############################
# BEGIN CUSTOM (added port)
# Generate minimal client config, if not supplied
sed -i "s/8080/${PORT}/g" /app/nginx.conf
if [ ! -f "${ALERTA_CONF_FILE}" ]; then
  export INIT=1
  echo "# Create client configuration file."
  cat >${ALERTA_CONF_FILE} << EOF
[DEFAULT]
endpoint = http://localhost:${PORT}/api
EOF
fi
# END CUSTOM
###############################


ADMIN_USER=${ADMIN_USERS%%,*}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-alerta}
MAXAGE=${ADMIN_KEY_MAXAGE:-315360000}  # default=10 years

# Generate minimal server config, if not supplied
if [ ! -f "${ALERTA_SVR_CONF_FILE}" ]; then
  echo "# Create server configuration file."
  cat >"${ALERTA_SVR_CONF_FILE}" << EOF
SECRET_KEY = '$(< /dev/urandom tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= | head -c 32)'
EOF
fi

# Init admin users and API keys
if [ -n "${ADMIN_USERS}" ]; then
  echo "# Create admin users."
  alertad user --all --password "${ADMIN_PASSWORD}" || true
  echo "# Create admin API keys."
  alertad key --all

  # Create user-defined API key, if required
  if [ -n "${ADMIN_KEY}" ]; then
    echo "# Create user-defined admin API key."
    alertad key --username "${ADMIN_USER}" --key "${ADMIN_KEY}" --duration "${MAXAGE}"
  fi
fi


if [ "${INIT}" -eq 1 ]; then
  # Add API key to client config, if required
  if [ "${AUTH_REQUIRED,,}" == "true" ]; then
    echo "# Auth enabled; add admin API key to client configuration."
    API_KEY=$(alertad key \
    --username "${ADMIN_USER}" \
    --scope "read" \
    --scope "write:alerts" \
    --scope "admin:management" \
    --duration "${MAXAGE}" \
    --text "Housekeeping")
    cat >>${ALERTA_CONF_FILE} << EOF
key = ${API_KEY}
EOF
  fi
fi

echo
echo '# Checking versions.'
echo Alerta Server ${SERVER_VERSION}
echo Alerta Client ${CLIENT_VERSION}
echo Alerta WebUI  ${WEBUI_VERSION}

nginx -v
echo uwsgi $(uwsgi --version)
mongo --version | grep MongoDB
psql --version
python3 --version
/venv/bin/pip list

echo
echo 'Alerta init process complete; ready for start up.'
echo

exec "$@"
