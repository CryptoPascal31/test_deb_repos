#!/bin/sh
set -e

# Stop and disable the service only on remove/purge (not on upgrade)
case "$1" in
    remove|purge)
        if [ -d /run/systemd/system ]; then
            systemctl stop chainweb.service || true
            systemctl disable chainweb.service || true
        fi
        ;;
esac
