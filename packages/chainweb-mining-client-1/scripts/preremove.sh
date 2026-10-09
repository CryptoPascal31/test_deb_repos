#!/bin/sh
set -e

# Stop and disable the service only on remove/purge (not on upgrade)
case "$1" in
    remove|purge)
        if [ -d /run/systemd/system ]; then
            systemctl stop chainweb-mining-client.service || true
            systemctl disable chainweb-mining-client.service || true
        fi
        ;;
esac
