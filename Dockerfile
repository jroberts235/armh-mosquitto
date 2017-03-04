# armh-MQTT docker image.
#
# VERSION 0.0.1

FROM jroberts235/rpi-raspian-jessie-20160831

MAINTAINER Jeff Roberts <https://github.com/jroberts235>

ENV DEBIAN_FRONTEND noninteractive

# Install packages
RUN apt-get update && \
    apt-get install wget vim -y && \
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key && \
    apt-key add mosquitto-repo.gpg.key && \
    cd /etc/apt/sources.list.d/ && \
    wget http://repo.mosquitto.org/debian/mosquitto-jessie.list && \
    apt-get update && \
    apt-get install mosquitto && \
    apt-get clean

# Expose MQTT port
EXPOSE 1883

CMD ["/usr/sbin/mosquitto"]
