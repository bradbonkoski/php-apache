FROM ubuntu:16.10
MAINTAINER Brad Bonkoski "brad.bonkoski@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

RUN apt-get install -y curl apache2 php7.0 php7.0-mysqlnd php7.0-memcached php7.0-xml php7.0-curl php7.0-mbstring git

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACKE_LOG_DIR /var/log/apache2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ONBUILD ADD . /var/wwww/

EXPOSE 80
#ENTRYPOINT ["/usr/sbin/apache2"]
#CMD ["-D", "FOREGROUND"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
