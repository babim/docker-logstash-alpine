FROM babim/logstash:base

ENV LOGSTASH 5.0.2

RUN cd /tmp \
  && wget --no-check-certificate -O logstash-$LOGSTASH.tar.gz https://artifacts.elastic.co/downloads/logstash/logstash-$LOGSTASH.tar.gz \
  && tar -xzf logstash-$LOGSTASH.tar.gz \
  && mv logstash-$LOGSTASH /usr/share/logstash \
  && rm -rf /tmp/* \
  && apk del --purge wget ca-certificates gnupg openssl

ENV PATH /usr/share/logstash/bin:/sbin:$PATH

# necessary for 5.0+ (overriden via "--path.settings", ignored by < 5.0)
ENV LS_SETTINGS_DIR /etc/logstash
# comment out some troublesome configuration parameters
#   path.log: logs should go to stdout
#   path.config: No config files found: /etc/logstash/conf.d/*
RUN set -ex \
  && if [ -f "$LS_SETTINGS_DIR/logstash.yml" ]; then \
  	sed -ri 's!^(path.log|path.config):!#&!g' "$LS_SETTINGS_DIR/logstash.yml"; \
  fi