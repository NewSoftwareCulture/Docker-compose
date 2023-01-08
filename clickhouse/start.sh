# Create volume
docker volume create clickhouse_vol

# Create network
docker network create app_sql_network

# Run clickhouse container
docker run --rm -d \
  --name clickhouse \
  --net=app_sql_network \
  -v clickhouse_vol:/var/lib/clickhouse \
  yandex/clickhouse-server

# Add package
docker exec superset pip install clickhouse-connect