#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""nginx Modification wrapper."""
from pathlib import Path
import os

print("****************************************")
print("NGINX MOD Starting up")
print("****************************************")

PORT = os.environ.get("PORT", "8080")
WEBFILE = Path("/app/nginx.conf")


def main():
    """Run main function."""
    cont = WEBFILE.read_text()
    cont = cont.replace("listen 8080", f"listen {PORT}")
    WEBFILE.write_text(cont)



if __name__ == "__main__":
    main()
