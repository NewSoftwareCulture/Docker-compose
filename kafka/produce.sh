export FILE="./messages.txt"
export KAFKA_URI="localhost:9092"
export KAFKA_TOPIC="test-cli"

cat $FILE \
| \
docker run --platform linux/amd64 -i confluentinc/cp-kafka:5.3.1 \
	/bin/bash ./usr/bin/kafka-console-producer \
	--broker-list $KAFKA_URI \
	--topic $KAFKA_TOPIC \
&& \
echo "OK"