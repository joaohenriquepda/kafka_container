
FROM openjdk:8u171-jdk-slim-stretch
MAINTAINER João Henrique

RUN apt-get update && \
    apt-get install -y  software-properties-common wget git gnupg2 nano python-pip

ARG KAFKA_VERSION
ARG ZOOKEEPER_PORT

# ENV KAFKA_ZOOKEEPER_CONNECT $KAFKA_ZOOKEEPER_CONNECT

RUN wget -q https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz
RUN tar -xzf kafka_2.11-${KAFKA_VERSION}.tgz -C /opt

ENV KAFKA_HOME /opt/kafka_2.11-${KAFKA_VERSION}

# COPY ./kafka/bootstrap.sh /opt
# COPY ./kafka/requirements.txt /opt
# COPY ./kafka/producer.twitter.py /opt

#Mudando a linha no arquivo
RUN sed -i "s|localhost:2181|${ZOOKEEPER_PORT}|g" $KAFKA_HOME/config/server.properties

WORKDIR /opt

# RUN chmod +x bootstrap.sh

# RUN pip install -r requirements.txt

# RUN ./kafka_2.11-1.1.0/bin/kafka-server-start.sh kafka_2.11-1.1.0/config/server.properties
