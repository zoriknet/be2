FROM busybox
#FROM phpstorm/php-71-apache-xdebug-26

#COPY composer.lock composer.json /var/www/html/

WORKDIR /var/www/html

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#    && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#    && php composer-setup.php \
#    && php -r "unlink('composer-setup.php');"

#RUN php composer.phar install --no-dev --no-scripts \
#    && rm composer.phar

COPY . /var/www/html

#RUN php artisan optimize

#ADD db.sql /docker-entrypoint-initdb.d