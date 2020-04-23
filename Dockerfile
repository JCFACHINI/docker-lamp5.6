FROM ubuntu
MAINTAINER JC Fachini <joaocarlosfachini@gmail.com>
LABEL Description="LAMP stack, with php 5.6, based on Ubuntu." \
	License="Apache License 2.0" \
	Usage="docker run -d -p [HOST WWW PORT NUMBER]:80 -p [HOST DB PORT NUMBER]:3306 -v [HOST WWW DOCUMENT ROOT]:/var/www/html -v [HOST DB DOCUMENT ROOT]:/var/lib/mysql jcfachini/lamp5.6" \
	Version="1.0"

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /var/www/html

RUN apt update -y
RUN apt upgrade -y
RUN apt install software-properties-common -y

RUN apt-get remove --purge php*
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt-get install apache2 php5.6-common php5.6-cli php5.6 libapache2-mod-php5.6 php5.6-mysql -y
RUN a2enmod rewrite
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
RUN chown -R www-data:www-data /var/www/html

RUN echo debconf mysql-server/root_password password 1234 | debconf-set-selections
RUN echo debconf mysql-server/root_password_again password 1234 | debconf-set-selections
RUN apt install mysql-server mysql-client -y -q

RUN apt-get install vim -y

EXPOSE 80
EXPOSE 3306

COPY run-lamp.sh /usr/sbin/
RUN chmod +x /usr/sbin/run-lamp.sh

CMD ["/usr/sbin/run-lamp.sh"]
