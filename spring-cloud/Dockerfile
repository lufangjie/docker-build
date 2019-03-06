FROM java:8
MAINTAINER lufangjie

RUN mkdir /usr/local/datacenter && chmod 777 -R /usr/local/datacenter

ADD jars /usr/local/datacenter
ADD config.ini /usr/local/datacenter/config.ini
ADD Dockerrun.sh /usr/local/datacenter/Dockerrun.sh

EXPOSE 8080

ENTRYPOINT ["sh", "/usr/local/datacenter/Dockerrun.sh"]
