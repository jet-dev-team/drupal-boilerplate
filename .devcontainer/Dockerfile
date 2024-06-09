FROM drupal:10.2-php8.3-apache

# Install dependencies and tools
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    git \
    vim \
    unzip \
    && apt-get clean -y

# Install node-sass
RUN echo 'Package: nodejs\nPin: origin deb.nodesource.com\nPin-Priority: 600' > /etc/apt/preferences.d/nodesource \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs
RUN npm install -g node-sass

# Install xdebug
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode = debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.start_with_request = yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port = 9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.log = /dev/null" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && rm -rf /tmp/pear

# PHP settings
RUN echo "output_buffering=On" >> /usr/local/etc/php/php.ini

RUN set -eux; \
	rm -rf /opt/drupal; \
	ln -sf /opt/drupal/drupal/web /var/www/html

ENV PATH=${PATH}:/opt/drupal/drupal/vendor/bin

# Fix dubious ownership in repository
RUN git config --global --add safe.directory /opt/drupal
