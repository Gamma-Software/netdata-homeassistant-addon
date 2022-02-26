#!/usr/bin/with-contenv bashio
bashio::log.info "Configuring Netdata..."
/usr/bin/config_netdata.sh
bashio::log.info "Starting Netdata..."
exec /opt/netdata/bin/netdata -p 19999 -D -c /etc/netdata/netdata.conf