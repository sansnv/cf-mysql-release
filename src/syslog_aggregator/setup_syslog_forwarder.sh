#!/usr/bin/env sh

set -e

if [ $# -ne 1 ]
then
    echo "Usage: setup_syslog_forwarder.sh [Config dir]"
    exit 1
fi

CONFIG_DIR=$1

# Place to spool logs if the upstream server is down
mkdir -p /var/vcap/sys/rsyslog/buffered
chown -R vcap:vcap /var/vcap/sys/rsyslog/buffered

cp $CONFIG_DIR/syslog_forwarder.conf /etc/rsyslog.d/00-syslog_forwarder.conf

/usr/sbin/service rsyslog reload
