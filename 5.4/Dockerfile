FROM babim/logstash:base

ENV LS_VERSION 5.4.3
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

# environment
ENV LOGSTASH_PATH /usr/share/logstash/bin
ENV LS_SETTINGS_DIR /usr/share/logstash/config
ENV PATH $LOGSTASH_PATH:$PATH
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'
ENV PATH /usr/share/logstash/bin:/sbin:$PATH