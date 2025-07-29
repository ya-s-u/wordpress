FROM wordpress:php7.4-apache

# 任意のサイズに変更（例：64MB）
ENV PHP_UPLOAD_MAX_FILESIZE=128M
ENV PHP_POST_MAX_SIZE=128M

# php.ini 設定を上書き
RUN echo "upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}" > /usr/local/etc/php/conf.d/uploads.ini && \
    echo "post_max_size = ${PHP_POST_MAX_SIZE}" >> /usr/local/etc/php/conf.d/uploads.ini

# 他のインストール作業
RUN apt-get update && apt-get install -y magic-wormhole

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www

