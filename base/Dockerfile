FROM babim/alpinebase

# Install Oracle Java
RUN apk add --no-cache openjdk8-jre

# ensure logstash user exists
RUN addgroup -S logstash && adduser -S -G logstash logstash

# install plugin dependencies
RUN apk add --no-cache \
# env: can't execute 'bash': No such file or directory
		bash \
		libzmq
RUN apk add --no-cache --virtual .fetch-deps \
		ca-certificates \
		gnupg \
		openssl \
		tar

# grab su-exec for easy step-down from root
RUN apk add --no-cache 'su-exec>=0.2'

COPY docker-entrypoint.sh /
VOLUME ["/etc/logstash/conf.d"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-e", ""]
