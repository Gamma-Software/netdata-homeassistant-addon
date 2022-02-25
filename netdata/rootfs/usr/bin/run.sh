#!/usr/bin/with-contenv bashio

NETDATA_TOKEN_CLAIM=$(bashio::config 'token_claim')
NETDATA_ROOM=$(bashio::config 'room')
NETDATA_URL=$(bashio::config 'url')
NETDATA_PORT=$(bashio::config 'port')

exec /opt/netdata/bin/netdata netdata-claim.sh -token=$NETDATA_TOKEN_CLAIM -rooms=$NETDATA_ROOM -url=$NETDATA_URL -D -p $NETDATA_PORT