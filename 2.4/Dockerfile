FROM babim/logstash:base

# environment
ENV LOGSTASH_PATH /usr/share/logstash/bin
ENV PATH $LOGSTASH_PATH:$PATH
# version
ENV LOGSTASH_VERSION 2.4.1
ENV LOGSTASH_TARBALL="https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz"

# install logstash
RUN wget -O logstash.tar.gz "$LOGSTASH_TARBALL"; \
	dir="$(dirname "$LOGSTASH_PATH")"; \
	\
	mkdir -p "$dir"; \
	tar -xf logstash.tar.gz --strip-components=1 -C "$dir"; \
	rm logstash.tar.gz; \
	\
	export LS_SETTINGS_DIR="$dir/config"; \
# if the "log4j2.properties" file exists (logstash 5.x), let's empty it out so we get the default: "logging only errors to the console"
	if [ -f "$LS_SETTINGS_DIR/log4j2.properties" ]; then \
		cp "$LS_SETTINGS_DIR/log4j2.properties" "$LS_SETTINGS_DIR/log4j2.properties.dist"; \
		truncate -s 0 "$LS_SETTINGS_DIR/log4j2.properties"; \
	fi; \
	\
# set up some file permissions
	for userDir in \
		"$dir/config" \
		"$dir/data" \
	; do \
		if [ -d "$userDir" ]; then \
			chown -R logstash:logstash "$userDir"; \
		fi; \
	done; \
	\
	logstash --version

# clean temp and remove unneed apps
RUN apk del --purge .fetch-deps ca-certificates openssl tar wget