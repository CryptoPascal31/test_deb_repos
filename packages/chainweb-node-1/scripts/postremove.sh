#!/bin/sh
set -e

if [ -d /run/systemd/system ]; then
    systemctl daemon-reload || true
fi

# On purge only: remove data and the service user/group
if [ "$1" = "purge" ]; then
    rm -rf /var/lib/chainweb
    if getent passwd chainweb >/dev/null; then
        deluser --system chainweb || true
    fi
    if getent group chainweb >/dev/null; then
        delgroup --system chainweb || true
    fi
fi