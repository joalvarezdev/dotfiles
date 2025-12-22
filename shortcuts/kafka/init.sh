#!/bin/bash

DEFAULT_HOST="localhost:9094"

kafka::send() {
  local message=$1
  local topic=$2
  local username=$3
  local password=$4
  local host=${5:-$DEFAULT_HOST}

  # if [[ $# -h ]]; then
  #     echo "Uso: kafka_send <mensaje> <topic> <username> <password> [host]"
  #     echo "Ejemplo: kafka_send 'Hola mundo' mi-topic user pass"
  #     echo "Ejemplo con host: kafka_send 'Hola mundo' mi-topic user pass localhost:9092"
  #     return 1
  # fi

  echo "$message" | ~/apps/kafka/bin/kafka-console-producer.sh \
      --bootstrap-server "$host" \
      --topic "$topic" \
      --producer-property security.protocol=SASL_PLAINTEXT \
      --producer-property sasl.mechanism=SCRAM-SHA-512 \
      --producer-property sasl.jaas.config="org.apache.kafka.common.security.scram.ScramLoginModule required username=\"$username\" password=\"$password\";"

}
