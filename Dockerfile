FROM alpine:3.4
MAINTAINER Wodby <admin@wodby.com>

# Create user www-data
RUN addgroup -g 82 -S www-data && \
	adduser -u 82 -D -S -G www-data www-data

# Install packages
RUN apk add --no-cache \
        openssl \
        ca-certificates \
        git \
        curl \
        wget \
        openssh

# Create work dir
RUN mkdir -p /var/www/html && chown -R 82:82 /var/www
WORKDIR /var/www/html
VOLUME /var/www/html

EXPOSE 22

COPY docker-entrypoint.sh /usr/local/bin/
CMD "docker-entrypoint.sh"
