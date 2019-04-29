FROM babim/logstash:base

ENV LS_VERSION 7.0.0
ENV LOGSTASH 7
ENV LS_URL "https://artifacts.elastic.co/downloads/logstash"
ENV LS_TARBAL "$LS_URL/logstash-oss-${LS_VERSION}.tar.gz"
ENV SOFT logstash

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ElasticStack%20install/${SOFT}_install.sh | bash

# environment
ENV LOGSTASH_PATH /usr/share/logstash/bin
ENV LS_SETTINGS_DIR /usr/share/logstash/config
ENV PATH $LOGSTASH_PATH:$PATH
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'
ENV PATH /usr/share/logstash/bin:/sbin:$PATH

VOLUME ["/etc/logstash/conf.d"]
EXPOSE 9600 5044
