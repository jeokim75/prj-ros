FROM ubuntu:18.04
MAINTAINER jeongsoon kim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y apache2 # Install Apahe web server (only 'yes')
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:ondrej/php
#RUN apt-get update
#RUN apt-get install -y php5.6

# Connect PHP & MYSQL
#RUN apt-get install -y php5.6-mysql


EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]

