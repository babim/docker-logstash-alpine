FROM babim/alpinebase:3.8

## alpine linux
RUN apk add --no-cache curl bash && \
	curl https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh && \
	chmod 755 /option.sh

ENV VERSION 6.3.2
ENV LOGSTASH 6
ENV XPACK true
ENV LS_URL "https://artifacts.elastic.co/downloads/logstash"
ENV LS_TARBAL "$LS_URL/logstash-${LS_VERSION}.tar.gz"
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

ENTRYPOINT ["/start.sh"]
CMD ["-e", ""]
#CMD ["/sbin/tini","--","/usr/bin/supervisord","-c", "/etc/supervisor/supervisord.conf"]