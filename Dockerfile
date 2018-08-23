FROM openjdk:8u171-jdk-slim-stretch
MAINTAINER João Henrique

RUN apt-get update && \
    apt-get install -y  software-properties-common wget git gnupg2 nano python-pip

ARG KAFKA_VERSION
ARG ZOOKEEPER_PORT

RUN echo ${ZOOKEEPER_PORT}

RUN echo "export ZOOKEEPER_PORT=${ZOOKEEPER_PORT}" >> ~/.bashrc

RUN wget -q https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz
RUN tar -xzf kafka_2.11-${KAFKA_VERSION}.tgz -C /opt

COPY ./kafka/bootstrap.sh /opt

WORKDIR /opt

ENV KAFKA_HOME kafka_2.11-${KAFKA_VERSION}

#Change line with port zookeeper
RUN sed -i "s|localhost:2181|${ZOOKEEPER_PORT}|g" $KAFKA_HOME/config/server.properties

RUN echo "export KAFKA_HOME=${KAFKA_HOME}" >> ~/.bashrc

RUN chmod +x bootstrap.sh
