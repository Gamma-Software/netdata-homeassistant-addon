#!/usr/bin/with-contenv bashio

#bashio::log.info "Configuring Netdata..."
#/usr/bin/config_netdata.sh

#bashio::log.info "Claiming agent to Netdata cloud... (may take a few seconds to show up in https://app.netdata.cloud)"
#/usr/bin/connect_to_netdata_cloud.sh &

bashio::log.info "Starting Netdata..."
#exec /opt/netdata/bin/netdata -p 19999 -D -c /etc/netdata/netdata.conf
NETDATA_HOSTNAME=$(bashio::config 'hostname')
NETDATA_CLAIM_URL=$(bashio::config 'claim_url')
NETDATA_CLAIM_TOKEN=$(bashio::config 'claim_token')
NETDATA_CLAIM_ROOMS=$(bashio::config 'claim_rooms')
exec /usr/sbin/run.sh