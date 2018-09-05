FROM babim/alpinebase

## alpine linux
RUN apk add --no-cache wget curl bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

ENV VERSION 6.3.2
ENV LOGSTASH 6
ENV XPACK true
ENV LOGSTASH_URL "https://artifacts.elastic.co/downloads/logstash"
ENV LOGSTASH_TARBALL "$LOGSTASH_URL/logstash-${LS_VERSION}.tar.gz"

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ElasticStack%20install/logstash_install.sh | bash
# remove packages
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ElasticStack%20install/logstash_clean.sh | bash

# environment
ENV LOGSTASH_PATH /usr/share/logstash/bin
ENV LS_SETTINGS_DIR /usr/share/logstash/config
ENV PATH $LOGSTASH_PATH:$PATH
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'
ENV PATH /usr/share/logstash/bin:/sbin:$PATH

VOLUME ["/etc/logstash/conf.d"]
EXPOSE 9600 5044
ENTRYPOINT ["/start.sh"]
CMD ["-e", ""]
