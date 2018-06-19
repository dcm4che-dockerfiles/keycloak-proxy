# Keycloak-proxy Docker image

This is a Dockerfile for Keycloak-proxy which can be used for securing Kibana which is used as an Audit Record Repository for the archive.

## Supported tags and respective `Dockerfile` links

- [`4.0.0-1` (*4.0.0-1/Dockerfile*)](https://github.com/dcm4che-dockerfiles/keycloak-proxy/blob/master/Dockerfile)

## How to use this image

See [Running on Docker](https://github.com/dcm4che/dcm4chee-arc-light/wiki/Running-on-Docker) at the
[dcm4che Archive 5 Wiki](https://github.com/dcm4che/dcm4chee-arc-light/wiki).

## Environment Variables 

Below explained environment variables can be set as per one's application to override the default values if need be.
An example of how one can set an env variable in `docker run` command is shown below :

    -e KEYCLOAK_DEVICE_NAME=my-keycloak

_**Note**_ : If default values of any environment variables were overridden in startup of `slapd` container, 
then ensure that the same values are also used for overriding the defaults during startup of keycloak container. 

#### `HTTP_PORT`

This environment variable sets the Http port of Wildfly. Default value is `8080`.

#### `HTTPS_PORT`

This environment variable sets the Https port of Wildfly. Default value is `8443`.

#### `KEYSTORE`

This environment variable sets the keystore used in ssl server identities in Wildfly configuration. Default value is 
`/opt/keycloak-proxy/conf/key.jks`.

#### `KEYSTORE_PASSWORD`

This environment variables sets the password of the keystore used in ssl server identities in Wildfly configuration. Default value is `secret`.

#### `KEY_PASSWORD`

This environment variables sets the password of the key used in ssl server identities in Wildfly configuration. Default value is `secret`.

#### `TRUSTSTORE`

This environment variable sets the truststore which will be used to verify Keycloak's certificate in Https communication.
Default value is `/opt/keycloak-proxy/conf/cacerts.jks`.

#### `TRUSSTORE_PASSWORD`

This environment variable sets the password of the above truststore. Default value is `secret`.

#### `ALLOW_ANY_HOSTNAME`

If the Keycloak server requires HTTPS and this config option is set to true the Keycloak server’s certificate is 
validated via the truststore, but host name validation is not done. Default value set is `true`.

#### `AUTH_SERVER_URL`

This environment variable is used to match auth-server-url used in the wildfly configuration for Keycloak. Default value is 
`https://keycloak:8443/auth`.

#### `SSL_REQUIRED`

This environment variable defines the SSL/HTTPS requirements for interacting with the realm. Default value is `external`.
Values which are accepted are : `external`, `none` or `all`.

#### `REALM_NAME`

This is the name of the realm configured in Keycloak for securing audit record repository. Default value is `dcm4che`. 

#### `CLIENT_ID`

This environment variable sets the client ID for the Kibana client. This value is used in creation of client for securing 
audit record repository which is running on Kibana. Default value set is `kibana`.

#### `PUBLIC_CLIENT`

If set to false, the adapter will send credentials for the client to Keycloak. The default value is `true`.

#### `CREDENTIAL_SECRET`

Specify the credential password of the application. This is REQUIRED for clients with 'Confidential' access type.

#### `BEARER_ONLY`

This should be set to true for services. If enabled the adapter will not attempt to authenticate users,
but only verify bearer tokens. The default value is `false`.

#### `TARGET_URL`

This environment variable sets the URL this server is proxying, and is REQUIRED. Default value is `http://kibana:5601`.

#### `BASE_PATH`

This environment variable sets the base context root for the application. Must start with '/' and is REQUIRED. Default 
value is `/`.

#### `ROLE_ALLOWED`

This environment variable sets the role of the user which will be allowed to use this service. Default value is `auditlog`.