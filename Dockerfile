# armh-MQTT docker image.
#
# VERSION 1.4.11

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
    apt-get install mosquitto -y && \
    apt-get clean

USER root
RUN useradd -U mosquitto && \
    mkdir /var/lib/mosquitto/ && \
    chown -R mosquitto. /var/lib/mosquitto

#COPY bin/mosquitto /usr/local/bin/mosquitto
#COPY etc/mosquitto.conf /etc/mosquitto/mosquitto.conf

COPY mosquitto.conf /etc/mosquitto/mosquitto.conf

# Expose MQTT port
EXPOSE 1883

USER mosquitto
CMD ["/usr/local/bin/mosquitto"]
