#!/bin/bash

set -e

if [ "$1" = 'keycloak-proxy' ]; then
    echo "Starting Keycloak Proxy $KEYCLOAK_VERSION"
    exec java -Xbootclasspath/p:/opt/keycloak-proxy/lib/alpn-boot.jar -jar /opt/keycloak-proxy/bin/launcher.jar /opt/keycloak-proxy/conf/proxy.json
    exit $?
fi

exec "$@"
