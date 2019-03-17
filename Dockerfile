FROM alpine:3.9

RUN apk --update add ca-certificates

RUN apk --no-cache add bash git curl unzip mysql-client php7 php7-bcmath php7-ctype php7-curl php7-dev php7-dom php7-fpm php7-gd php7-imagick php7-intl php7-mbstring php7-mcrypt php7-opcache php7-openssl php7-pdo php7-pdo_mysql php7-phar php7-xml php7-soap php7-xsl php7-zip php7-json php7-iconv

EXPOSE 9000
CMD ["php-fpm7"]
