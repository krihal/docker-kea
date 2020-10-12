FROM debian:latest
MAINTAINER Kristofer Hallin (kristofer@sunet.se)

RUN apt-get update
RUN apt-get install -y kea-dhcp4-server kea-dhcp6-server git supervisord

COPY kea.sh /usr/local/bin/kea.sh
COPY supervisord.conf /etc/supervisor/supervisord.conf


EXPOSE 67 67/udp
EXPOSE 8080

ENTRYPOINT supervisord -c /etc/supervisor/supervisord.conf
