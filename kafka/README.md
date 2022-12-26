# Kafka

## Работа с контейнерами

#### Запуск

```bash
docker-compose up -d
```

#### Остановка

```bash
docker-compose down -v
```

#### Вывод в виде таблицы

```bash
docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}'
```

## Просмотр логов

```bash
docker logs kafka
docker logs zookeeper
```

## Выполнение команд внутри контейнера docker

#### 
```bash
docker exec -i kafka bash
```

#### Интерактивный режим

```bash
docker exec -it kafka bash
```

## Отправка сообщений в кафку 

#### Интерактивный режим

```bash
docker exec -it kafka bash ./usr/bin/kafka-console-producer --broker-list HOST:PORT --topic TOPIC
```

#### Из файла

```bash
docker exec -i kafka bash ./usr/bin/kafka-console-producer --broker-list HOST:PORT --topic TOPIC < messages.txt
```

#### Из пайплайна

```bash
echo "Pipeline 2" | docker exec -i kafka bash ./usr/bin/kafka-console-producer --broker-list HOST:PORT --topic TOPIC
```

---
Docs:

https://medium.com/@TimvanBaarsen/apache-kafka-cli-commands-cheat-sheet-a6f06eac01b