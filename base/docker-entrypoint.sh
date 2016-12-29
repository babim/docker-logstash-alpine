#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
# allow the container to be started with `--user`
if [ "$1" = 'logstash' -a "$(id -u)" = '0' ]; then
	chown -R logstash: /usr/share/logstash
	chown -R logstash: /etc/logstash/conf.d/
# chown -R logstash: /opt/logstash/patterns

	set -- su-exec logstash "$@"
fi

exec "$@"
