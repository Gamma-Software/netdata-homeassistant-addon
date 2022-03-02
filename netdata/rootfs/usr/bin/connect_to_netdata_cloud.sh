#!/usr/bin/env bashio

sleep 10 # Wait for 10 second for Netdata to start

NETDATA_HOSTNAME=$(bashio::config 'hostname')
NETDATA_CLOUD_URL=$(bashio::config 'claim_url')
NETDATA_CLOUD_TOKEN=$(bashio::config 'claim_token')
NETDATA_CLOUD_ROOMS=$(bashio::config 'claim_rooms')

curl -s https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh
sh /tmp/netdata-kickstart.sh --claim-hostname ${NETDATA_HOSTNAME} --claim-token ${NETDATA_CLOUD_TOKEN} --claim-rooms ${NETDATA_CLOUD_ROOMS} --claim-url ${NETDATA_CLOUD_URL}