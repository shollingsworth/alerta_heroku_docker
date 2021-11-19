#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""nginx wrapper."""
from pathlib import Path
import os

PORT = os.environ.get("PORT", "8080")
WEBFILE = Path("/app/nginx.conf")
ALERTA_CONF = Path("/app/alerta.conf")


def main():
    """Run main function."""
    cont = WEBFILE.read_text()
    cont = cont.replace("listen 8080", f"listen {PORT}")
    WEBFILE.write_text(cont)

    cont = ALERTA_CONF.read_text()
    cont = cont.replace(":8080", f":{PORT}")
    ALERTA_CONF.write_text(cont)
    os.system("nginx -c /app/nginx.conf")


if __name__ == "__main__":
    main()
