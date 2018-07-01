FROM babim/logstash:base

ENV LS_VERSION 5.5.3
ENV LOGSTASH_URL "https://artifacts.elastic.co/downloads/logstash"
ENV LOGSTASH_TARBALL "$LOGSTASH_URL/logstash-${LS_VERSION}.tar.gz"

RUN cd /tmp \
  && wget --no-check-certificate --progress=bar:force -O logstash.tar.gz "$LOGSTASH_TARBALL"; \
  tar -xzf logstash.tar.gz \
  && mv logstash-$LS_VERSION /usr/share/logstash \
  && rm -rf /tmp/* \
  && apk del --purge wget ca-certificates gnupg openssl

RUN set -ex; \
  if [ -f "$LS_SETTINGS_DIR/log4j2.properties" ]; then \
    cp "$LS_SETTINGS_DIR/log4j2.properties" "$LS_SETTINGS_DIR/log4j2.properties.dist"; \
    truncate -s 0 "$LS_SETTINGS_DIR/log4j2.properties"; \
  fi