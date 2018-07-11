FROM babim/logstash:base

ENV LOGSTASH 2.3.4

# ensure logstash user exists
RUN adduser -DH -s /sbin/nologin logstash

RUN cd /tmp \
  && wget --no-check-certificate --progress=bar:force -O logstash-$LOGSTASH.tar.gz https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH.tar.gz \
  && tar -xzf logstash-$LOGSTASH.tar.gz \
  && mv logstash-$LOGSTASH /usr/share/logstash \
  && rm -rf /tmp/* \
  && apk del --purge wget ca-certificates gnupg openssl

ENV PATH /usr/share/logstash/bin:$PATH

# necessary for 5.0+ (overriden via "--path.settings", ignored by < 5.0)
ENV LS_SETTINGS_DIR /etc/logstash
# comment out some troublesome configuration parameters
#   path.log: logs should go to stdout
#   path.config: No config files found: /etc/logstash/conf.d/*
RUN set -ex \
	&& if [ -f "$LS_SETTINGS_DIR/logstash.yml" ]; then \
		sed -ri 's!^(path.log|path.config):!#&!g' "$LS_SETTINGS_DIR/logstash.yml"; \
	fi

VOLUME ["/etc/logstash/conf.d"]
EXPOSE 9600 5044
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-e", ""]
