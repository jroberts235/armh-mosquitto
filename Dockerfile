# armh-MQTT docker image.
#
# VERSION 1.4.11

FROM jroberts235/rpi-raspian-jessie-20160831

MAINTAINER Jeff Roberts <https://github.com/jroberts235>

ENV DEBIAN_FRONTEND noninteractive

USER root
RUN useradd -U mosquitto && \
    mkdir /var/lib/mosquitto/ && \
    chown -R mosquitto. /var/lib/mosquitto

COPY bin/mosquitto /usr/local/bin/mosquitto
COPY etc/mosquitto.conf /etc/mosquitto/mosquitto.conf

# Expose MQTT port
EXPOSE 1883

USER mosquitto
CMD ["/usr/local/bin/mosquitto"]
