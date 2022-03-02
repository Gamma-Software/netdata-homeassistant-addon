#!/usr/bin/with-contenv bashio
bashio::log.info "Configuring Netdata..."
/usr/bin/config_netdata.sh

bashio::log.info "Connecting Netdata instance to cloud..."
NETDATA_CLOUD_TOKEN=$(bashio::config 'cloud_token')
NETDATA_CLOUD_ROOMS=$(bashio::config 'cloud_rooms')

bashio::log.info "Starting Netdata..."
exec /opt/netdata/bin/netdata -p 19999 -D -c /etc/netdata/netdata.conf -W "claim -token=${NETDATA_CLOUD_TOKEN} -rooms=${NETDATA_CLOUD_ROOMS}" aclk-state