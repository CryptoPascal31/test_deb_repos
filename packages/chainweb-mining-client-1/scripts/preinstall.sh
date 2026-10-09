#!/bin/sh
set -e

# Create the dedicated system group and user (idempotent)
if ! getent group chainweb-mining-client >/dev/null; then
    addgroup --system chainweb-mining-client
fi

if ! getent passwd chainweb-mining-client >/dev/null; then
    adduser --system \
        --ingroup chainweb-mining-client \
        --home /var/lib/chainweb-mining-client \
        --no-create-home \
        --shell /usr/sbin/nologin \
        --gecos "chainweb-mining-client service user" \
        chainweb-mining-client
fi
