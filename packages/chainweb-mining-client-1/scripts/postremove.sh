#!/bin/sh
set -e

if [ -d /run/systemd/system ]; then
    systemctl daemon-reload || true
fi

# On purge only: remove data and the service user/group
if [ "$1" = "purge" ]; then
    rm -rf /var/lib/chainweb-mining-client
    if getent passwd chainweb-mining-client >/dev/null; then
        deluser --system chainweb-mining-client || true
    fi
    if getent group chainweb-mining-client >/dev/null; then
        delgroup --system chainweb-mining-client || true
    fi
fi