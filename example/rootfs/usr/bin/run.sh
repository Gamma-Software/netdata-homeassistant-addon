#!/usr/bin/with-contenv bashio

NETDATA_PORT=$(bashio::config 'port')

exec /opt/netdata/bin/netdata -D -p ${NETDATA_PORT}