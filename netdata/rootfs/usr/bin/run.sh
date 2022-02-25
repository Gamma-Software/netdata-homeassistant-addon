#!/usr/bin/with-contenv bashio
bashio::log.info "Configuring Netdata..."
/usr/bin/config_netdata.sh

#bashio::log.info "Connecting Netdata instance to cloud..."
#NETDATA_CLOUD_URL=$(bashio::config 'cloud_url')
#NETDATA_CLOUD_TOKEN=$(bashio::config 'cloud_token')
#NETDATA_CLOUD_ROOMS=$(bashio::config 'cloud_rooms')
#curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --claim-token ${NETDATA_CLOUD_TOKEN} --claim-rooms ${NETDATA_CLOUD_ROOMS} --claim-url ${NETDATA_CLOUD_URL}

bashio::log.info "Starting Netdata..."
exec /opt/netdata/bin/netdata -p 19999 -D -c /etc/netdata/netdata.conf