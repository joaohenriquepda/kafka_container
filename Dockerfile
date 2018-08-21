FROM openjdk:8u171-jdk-slim-stretch

RUN apt-get update && \
    apt-get install -y  software-properties-common wget git gnupg2 nano python-pip

ENV KAFKA_VERSION 1.1.0

RUN wget -q https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz
RUN tar -xzf kafka_2.11-${KAFKA_VERSION}.tgz -C /opt

ENV KAFKA_HOME /opt/kafka_2.11-${KAFKA_VERSION}

#Mudando a linha no arquivo
RUN sed -i "s|localhost:2181|zookeeper_kafka:2181|g" $KAFKA_HOME/config/server.properties

WORKDIR /opt
