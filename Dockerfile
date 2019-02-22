FROM alpine:3.9

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates

RUN echo "@php http://php.codecasts.rocks/v3.7/php-7.1/" >> /etc/apk/repositories

RUN apk --no-cache add bash groff less curl git zip py-pip python
RUN pip install --upgrade awscli pip python-dateutil

RUN apk add --update php7@php php7-bcmath@php php7-ctype@php php7-curl@php php7-dom@php php7-gd@php php7-imagick@php php7-intl@php php7-mbstring@php php7-mcrypt@php php7-openssl@php php7-pdo@php php7-pdo_mysql@php php7-phar@php php7-xml@php php7-soap@php php7-xsl@php php7-zip@php php7-json@php php7-iconv@php

RUN ln -s /usr/bin/php7 /usr/bin/php

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

EXPOSE 9000
CMD ["php-fpm"]