#!/bin/sh
set -e

if [ -d /run/systemd/system ]; then
    systemctl daemon-reload
    systemctl enable chainweb-mining-client.service

    # $2 is empty on a fresh install, set to the old version on an upgrade
    if [ -z "$2" ]; then
        systemctl start chainweb-mining-client.service
    else
        systemctl try-restart chainweb-mining-client.service
    fi
fi
