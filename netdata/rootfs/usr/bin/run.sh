#!/usr/bin/with-contenv bashio
bashio::log.info "Configuring Netdata..."
/usr/bin/config_netdata.sh

bashio::log.info "Claiming agent to Netdata cloud... (may take a few seconds to show up in https://app.netdata.cloud)"
/usr/bin/connect_to_netdata_cloud.sh &

bashio::log.info "Starting Netdata..."
exec /opt/netdata/bin/netdata -p 19999 -D -c /etc/netdata/netdata.conf