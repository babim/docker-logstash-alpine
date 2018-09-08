FROM babim/logstash:base

ENV LS_VERSION 6.2.4
ENV LOGSTASH 6
ENV LS_URL "https://artifacts.elastic.co/downloads/logstash"
ENV LS_TARBAL "$LS_URL/logstash-${LS_VERSION}.tar.gz"

# install
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ElasticStack%20install/logstash_install.sh | bash
# remove packages
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ElasticStack%20install/logstash_clean.sh | bash

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
