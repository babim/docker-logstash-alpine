FROM babim/alpinebase

## alpine linux
RUN apk add --no-cache wget bash && cd / && wget --no-check-certificate https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh && \
    chmod 755 /option.sh

# Install Oracle Java
RUN apk add --no-cache openjdk8-jre tini su-exec libzmq bash libc6-compat

# ensure logstash user exists
RUN adduser -DH -s /sbin/nologin logstash

RUN mkdir -p /usr/local/lib \
	&& ln -s /usr/lib/*/libzmq.so.3 /usr/local/lib/libzmq.so
RUN apk add --no-cache wget ca-certificates gnupg openssl

COPY docker-entrypoint.sh /

# environment
ENV LOGSTASH_PATH /usr/share/logstash/bin
ENV PATH $LOGSTASH_PATH:$PATH
ENV LS_SETTINGS_DIR /usr/share/logstash/config
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

VOLUME ["/etc/logstash/conf.d"]
EXPOSE 9600 5044
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-e", ""]
