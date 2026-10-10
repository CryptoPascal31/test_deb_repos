#!/bin/sh
set -e

# Create the dedicated system group and user (idempotent)
if ! getent group chainweb >/dev/null; then
    addgroup --system chainweb
fi

if ! getent passwd chainweb >/dev/null; then
    adduser --system \
        --ingroup chainweb \
        --home /var/lib/chainweb \
        --shell /usr/sbin/nologin \
        --gecos "chainweb service user" \
        chainweb
fi

install -d -o chainweb -g chainweb -m 0755 /var/lib/chainweb/db