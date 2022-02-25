#!/usr/bin/env bashio

# Retrieve the default Netdata configuration
/opt/netdata/bin/netdata -d -p 19999 & sleep 2
curl -so /etc/netdata/netdata.conf http://localhost:19999/netdata.conf
pkill -9 netdata

# Configure Netdata
TAB=$'\t'

NETDATA_HOSTNAME=$(bashio::config 'hostname')
bashio::log.info "Netdata configuration: set hostname to ${NETDATA_HOSTNAME}"
sed -i "s/${TAB}# hostname = .*/${TAB}hostname = ${NETDATA_HOSTNAME}/" /etc/netdata/netdata.conf

NETDATA_PAGE_CACHE_SIZE=$(bashio::config 'page_cache_size')
bashio::log.info "Netdata configuration: set page_cache_size to ${NETDATA_PAGE_CACHE_SIZE}"
sed -i "s/${TAB}# page cache size = .*/${TAB}page cache size = ${NETDATA_PAGE_CACHE_SIZE}/" /etc/netdata/netdata.conf

NETDATA_DBENGINE_DISK_SPACE=$(bashio::config 'dbengine_disk_space')
bashio::log.info "Netdata configuration: set page_cache_size to ${NETDATA_DBENGINE_DISK_SPACE}"
sed -i "s/${TAB}# dbengine multihost disk space = .*/${TAB}dbengine multihost disk space = ${NETDATA_DBENGINE_DISK_SPACE}/" /etc/netdata/netdata.conf

NETDATA_ENABLE_ALARM=$(bashio::config 'enable_alarm')
if [[ ${NETDATA_ENABLE_ALARM} == "false" ]]
then
    bashio::log.info "Netdata configuration: alarm is ${NETDATA_DISABLE_ALARM}"
    sed -i "s/${TAB}# enabled = .*/${TAB}enabled = no/" /etc/netdata/netdata.conf
fi

NETDATA_ENABLE_LOG=$(bashio::config 'enable_log')
if [[ ${NETDATA_ENABLE_LOG} == "false" ]]
then
    bashio::log.info "Netdata configuration: logging is ${NETDATA_DISABLE_LOG}"
    sed -i "s/${TAB}# debug log = .*/${TAB}debug log = none/" /etc/netdata/netdata.conf
    sed -i "s/${TAB}# error log = .*/${TAB}error log = none/" /etc/netdata/netdata.conf
    sed -i "s/${TAB}# access log = .*/${TAB}access log = none/" /etc/netdata/netdata.conf
fi

# TODO to increase security and performance
# [web]
#   mode = none
#[web]
#    allow connections from = localhost *
#    allow dashboard from = localhost *
#    allow badges from = *
#    allow streaming from = *
#    allow netdata.conf from = localhost fd* 10.* 192.168.* 172.16.* 172.17.* 172.18.* 172.19.* 172.20.* 172.21.* 172.22.* 172.23.* 172.24.* 172.25.* 172.26.* 172.27.* 172.28.* 172.29.* 172.30.* 172.31.*
#    allow management from = localhost