FROM babim/logstash:base

ENV VERSION 6.0.1
ENV DOWNLOAD_URL https://artifacts.elastic.co/downloads/logstash
ENV TARBALL "${DOWNLOAD_URL}/logstash-${VERSION}.tar.gz"

RUN set -ex \
  && cd /tmp \
  && wget --no-check-certificate -O logstash.tar.gz "$TARBALL"; \
  tar -xzf logstash.tar.gz \
  && mv logstash-$VERSION /usr/share/logstash \
  && rm -rf /tmp/* \
  && apk del .build-deps  wget

RUN apk add --no-cache libc6-compat

RUN set -ex; \
  if [ -f "$LS_SETTINGS_DIR/log4j2.properties" ]; then \
  cp "$LS_SETTINGS_DIR/log4j2.properties" "$LS_SETTINGS_DIR/log4j2.properties.dist"; \
  truncate -s 0 "$LS_SETTINGS_DIR/log4j2.properties"; \
  fi

COPY config/logstash /usr/share/logstash/config/
COPY config/pipeline/default.conf /usr/share/logstash/pipeline/logstash.conf