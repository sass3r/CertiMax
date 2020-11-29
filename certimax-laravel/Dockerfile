#Image Ubuntu 18
FROM ubuntu:20.04
MAINTAINER certimax
#update ubuntu software repository
ENV TZ 'America/La_Paz'
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
# install curl https transport git zip
RUN apt install -y curl apt-transport-https git zip software-properties-common
#install php 7.4
RUN apt install -y php7.4 php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline php7.4-mysql php7.4-fpm \
php7.4-mbstring \
php7.4-xml \
php7.4-phar \
php7.4-gd \
php7.4-curl \
php7.4-cgi \
php7.4-intl \
php7.4-snmp
#install nginx
RUN apt install -y nano
RUN apt install -y nginx
RUN rm /etc/nginx/sites-enabled/default
COPY nginx/vhosts/prodvhostlaravel /etc/nginx/sites-available/prodvhostlaravel
RUN ln -s /etc/nginx/sites-available/prodvhostlaravel /etc/nginx/sites-enabled/
RUN rm -r /var/www/html/
RUN mkdir -p /etc/ssl/certs/
RUN mkdir -p /etc/ssl/private/
COPY nginx/ssl/localhost.crt /etc/ssl/certs/localhost.crt
COPY nginx/ssl/localhost.key /etc/ssl/private/localhost.key
WORKDIR /var/www/
#install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/ && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
COPY ./ /var/www/
COPY nginx/env /var/www/.env
COPY composer.json /var/www/
COPY composer.lock /var/www/
RUN chown -R www-data:www-data /var/www/
RUN chmod -R 777 storage bootstrap
RUN composer install
RUN php artisan config:cache
# RUN php artisan migrate:refresh --seed
RUN php artisan storage:link
EXPOSE 80 443
#daemon nginx
CMD /etc/init.d/php7.4-fpm start && /usr/sbin/nginx -g "daemon off;"