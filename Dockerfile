FROM ubuntu
MAINTAINER Kristofer Hallin (kristofer@sunet.se)

RUN apt-get update
RUN apt-get install -y kea-dhcp4-server kea-dhcp6-server git supervisor

COPY kea.sh /usr/local/bin/kea.sh
COPY supervisord.conf /etc/supervisor/supervisord.conf

RUN chmod +x /usr/local/bin/kea.sh

EXPOSE 67 67/udp
EXPOSE 8080

ENTRYPOINT supervisord -c /etc/supervisor/supervisord.conf
