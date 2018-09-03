#!/bin/bash

# # bin/zookeeper-server-start.sh config/zookeeper.properties
# echo ${HOME}${ZK_HOME}
# # echo

# echo " ----------------- "
# echo "Criando o topic"
# echo " ----------------- "
# ./kafka_2.11-1.1.0/bin/kafka-server-start.sh kafka_2.11-1.1.0/config/server.properties &


echo " ----------------- "
echo "Criando o topico" $var $1
echo " ----------------- "

# echo $KAFKA_HOME
# echo $ZOOKEEPER_PORT
# echo ${ZOOKEEPER_PORT}
# echo $ZK_HOME


./kafka_2.11-1.1.0/bin/kafka-topics.sh --create --zookeeper $ZOOKEEPER_PORT --replication-factor 1 --partitions 1 --topic $1

# ./$KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper $ZOOKEEPER_PORT
# ./kafka_2.11-1.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic streamTwitter

# python3 producer.twitter.py
