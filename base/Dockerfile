FROM babim/alpinebase

# Install Oracle Java
RUN apk add --no-cache openjdk8-jre tini su-exec libzmq bash libc6-compat

# ensure logstash user exists
RUN adduser -DH -s /sbin/nologin logstash

RUN mkdir -p /usr/local/lib \
	&& ln -s /usr/lib/*/libzmq.so.3 /usr/local/lib/libzmq.so
RUN apk-install -t build-deps wget ca-certificates gnupg openssl

COPY docker-entrypoint.sh /
VOLUME ["/etc/logstash/conf.d"]
EXPOSE 9600 5044
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-e", ""]
