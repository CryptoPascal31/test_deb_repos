#!/bin/sh
set -e

if [ -d /run/systemd/system ]; then
    systemctl daemon-reload

    # $2 is empty on a fresh install, set to the old version on an upgrade
    if [ -z "$2" ]; then
        echo "To start the node: run 'systemctl start chainweb.service'"
    else
        systemctl try-restart chainweb.service
    fi
fi
