#!/bin/sh
set -e

if [ -d /run/systemd/system ]; then
    systemctl daemon-reload

    # $2 is empty on a fresh install, set to the old version on an upgrade
    if [ -z "$2" ]; then
         echo "To start the client: run 'systemctl start chainweb-mining-client.service'"
    else
        systemctl try-restart chainweb-mining-client.service
    fi
fi
