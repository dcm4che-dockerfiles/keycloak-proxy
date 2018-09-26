#!/bin/bash

set -e

if [ "$1" = 'keycloak-proxy' ]; then

    if [ -n "$KEYSTORE_PASSWORD_FILE" ] && [ -f $KEYSTORE_PASSWORD_FILE ]; then
        KEYSTORE_PASSWORD=$(cat $KEYSTORE_PASSWORD_FILE)
    fi

    if [ -n "$KEY_PASSWORD_FILE" ] && [ -f $KEY_PASSWORD_FILE ]; then
        KEY_PASSWORD=$(cat $KEY_PASSWORD_FILE)
    fi

    if [ -n "$TRUSTSTORE_PASSWORD_FILE" ] && [ -f $TRUSTSTORE_PASSWORD_FILE ]; then
        TRUSTSTORE_PASSWORD=$(cat $TRUSTSTORE_PASSWORD_FILE)
    fi

    echo "Starting Keycloak Proxy $KEYCLOAK_VERSION"
    exec java -Xbootclasspath/p:/opt/keycloak-proxy/lib/alpn-boot.jar -jar /opt/keycloak-proxy/bin/launcher.jar /opt/keycloak-proxy/conf/proxy.json
    exit $?
fi

exec "$@"
